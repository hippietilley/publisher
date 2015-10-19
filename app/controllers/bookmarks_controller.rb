class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Bookmark.all
    else
      @posts = Bookmark.visible.all
    end
  end

  def show
  end

  def new
    @post = Bookmark.new
  end

  def edit
  end

  def create
    @post = Bookmark.new(bookmark_params)

    if @post.save
      redirect_to @post.path, notice: "Bookmark was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(bookmark_params)
      redirect_to @post.path, notice: "Bookmark was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed."
  end

  private

  def set_bookmark
    @post = Bookmark.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def bookmark_params
    params.require(:bookmark).permit(:title, :subtitle, :content, :bookmark_author,
      :bookmark_excerpt, :bookmark_url, :slug, :in_reply_to, :tags, :published_at, :private)
  end
end
