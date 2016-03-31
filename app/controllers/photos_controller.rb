class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = "Photos"
    @posts = Post.of(:photo).for_user(current_user).page(params[:page]).all.per_page(5)
    render "/posts/index"
  end

  def show
    @page_title = @post.name
    render "/posts/show"
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
    @post = PostForm.new(Photo)
    if @post.submit(params[:photo])
      save_tags(@post, photo_params)
      redirect_to @post.path, notice: "Photo was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Photo, @post)
    if @post.update(photo_params)
      save_tags(@post, photo_params)
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
  
  def post_class
    Photo
  end

  def set_photo
    @post = Post.of(:photo).where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def photo_params
    params.require(:photo).permit(:title, :subtitle, :content, :slug, :in_reply_to,
      :tags, :published_at, :private, :image_url, :width, :height, :captured_at)
  end
end
