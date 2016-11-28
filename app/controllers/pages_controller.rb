class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = "Pages"
    @posts = Post.of(:page).for_user(current_user).page(params[:page]).all.per_page(5)
    render "/posts/index"
  end

  def show
    # no layout
    if @post.post_type.hide_layout?
      render text: @post.content, layout: false
    else
      @page_title = @post.name
      render "/posts/show"
    end
  end

  def new
    @page_title = "New #{post_class.to_s}"
    @post = PostForm.new(post_class)
    render "posts/new", layout: "admin"
  end

  def edit
    @page_title = "Editing #{post_class.to_s}: #{@post.name}"
    @post = PostForm.new(post_class, @post)
    render "posts/edit", layout: "admin"
  end

  def create
    @post = PostForm.new(post_class, @post)
    if @post.submit(params.require(:page))
      save_tags(@post, page_params)
      redirect_to @post.path, notice: "#{post_class} was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(post_class, @post)
    if @post.update(page_params)
      save_tags(@post, page_params)
      redirect_to @post.path, notice: "#{post_class} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to pages_url, notice: "#{post_class} was successfully destroyed."
  end

  private

  def post_class
    Page
  end

  def set_page
    @post = Post.of(:page).find_by(slug: params[:slug])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def page_params
    params.require(:page).permit(:title,
      :subtitle,
      :content,
      :slug,
      :show_in_nav,
      :in_reply_to,
      :tags,
      :published_at,
      :private,
      :hide_header,
      :hide_footer,
      :hide_layout)
  end
end
