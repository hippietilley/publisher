class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /bookmarks
  def index
    if signed_in?
      @bookmarks = Bookmark.all
    else
      @bookmarks = Bookmark.visible.all
    end

    @posts = @bookmarks.sort_by(&:published_at).reverse
  end

  # GET /bookmarks/1
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
    return redirect_to(root_path) if @bookmark.private? && !signed_in?
  end

  # Only allow a trusted parameter "white list" through.
  def bookmark_params
    params.require(:bookmark).permit(:title, :subtitle, :content, :bookmark_author, :bookmark_excerpt, :bookmark_url, :slug, :in_reply_to, :tags, :published_at, :private)
  end
end
