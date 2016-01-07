# Everything is called @post instead of @page so that other things Just Work
class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Post.of(:page).all
    else
      @posts = Post.of(:page).visible.all
    end
  end

  def show
    # find old path and redirect to new one
    redirect = Redirect.find_by(source_path: params[:path])
    return redirect_to("/" + redirect.target_path) unless redirect.nil?

    # if no redirect is found, look page or redirect to home
    @post = Post.of(:page).find_by(slug: params[:path])
    if @post.nil?
      return redirect_to root_path
    else
      return render "/posts/show"
    end
  end

  def new
    @post = PostForm.new(Page)
  end

  def edit
  end

  def create
    @post = PostForm.new(Page, @post)

    if @post.submit(params.require(:page))
      save_tags(@post, page_params)
      redirect_to slugged_page_path(@post.slug), notice: "Page was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Page, @post)
    if @post.update(page_params)
      save_tags(@post, page_params)
      redirect_to slugged_page_path(@post.slug), notice: "Page was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to pages_url, notice: "Page was successfully destroyed."
  end

  private

  def set_page
    @post = Post.of(:page).find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title,
      :subtitle,
      :content,
      :slug,
      :tags,
      :published_at,
      :private)
  end
end
