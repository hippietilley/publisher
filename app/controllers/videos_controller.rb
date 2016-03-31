class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = "Videos"
    @posts = Post.of(:video).for_user(current_user).page(params[:page]).all.per_page(5)
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
    @post = PostForm.new(Video)
    if @post.submit(params[:video])
      save_tags(@post, video_params)
      redirect_to @post.path, notice: "Video was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Video, @post)
    if @post.update(video_params)
      save_tags(@post, video_params)
      redirect_to @post.path, notice: "Video was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to videos_url, notice: "Video was successfully destroyed."
  end

  private
  
  def post_class
    Video
  end

  def set_video
    @post = Post.of(:video).where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def video_params
    params.require(:video).permit(:captured_at, :content, :duration, :enclosure_url,
      :height, :image_url, :in_reply_to, :private, :published_at, :slug, :subtitle,
      :tags, :title, :width)
  end
end
