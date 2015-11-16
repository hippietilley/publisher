class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Photo.all
    else
      @posts = Photo.visible.all
    end
  end

  def show
  end

  def new
    @post = PostForm.new(Photo)
  end

  def edit
    @post = PostForm.new(Photo, @post)
  end

  def create
    @post = PostForm.new(Photo)

    if @post.submit(params[:photo])
      redirect_to @post.path, notice: "Photo was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Photo, @post)
    if @post.update(photo_params)
      redirect_to @post.path, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to photos_url, notice: "Photo was successfully destroyed."
  end

  private

  def set_photo
    @post = Post.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def photo_params
    params.require(:photo).permit(:title, :subtitle, :content, :slug, :in_reply_to,
      :tags, :published_at, :private, :image_url, :width, :height, :captured_at)
  end
end
