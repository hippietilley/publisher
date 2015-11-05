class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # Everything is called @post instead of @page so that other things Just Work

  def index
    if signed_in?
      @posts = Page.all
    else
      @posts = Page.visible.all
    end
  end

  def show
    @post = Page.find_by(slug: params[:slug])
  end

  def new
    @post = Page.new
  end

  def edit
  end

  def create
    @post = Page.new(page_params)

    if @post.save
      save_tags(@post, page_params)
      redirect_to slugged_page_path(@post.slug), notice: "Page was successfully created."
    else
      render :new
    end
  end

  def update
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
    @post = Page.find(params[:id])
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
