class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Video.paginate(page: params[:page]).all
    else
      @posts = Video.visible.paginate(page: params[:page]).all
    end
  end

  def show
  end

  def new
    @post = Video.new
  end

  def edit
  end

  def create
    @post = Video.new(video_params)

    if @post.save
      redirect_to @post.path, notice: "Video was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(video_params)
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

  def set_video
    @post = Video.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def video_params
    params.require(:video).permit(:captured_at, :content, :duration, :enclosure_url,
      :height, :image_url, :in_reply_to, :private, :published_at, :slug, :subtitle,
      :tags, :title, :width)
  end
end
