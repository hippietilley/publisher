class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /videos
  def index
    if signed_in?
      @posts = Video.all
    else
      @posts = Video.where(private: false)
    end

    @posts = @posts.sort_by(&:published_at).reverse
  end

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @post = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  def create
    @post = Video.new(video_params)

    if @post.save
      redirect_to @post, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @post.update(video_params)
      redirect_to @post, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /videos/1
  def destroy
    @post.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @post = Video.find(params[:id])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  # Only allow a trusted parameter "white list" through.
  def video_params
    params.require(:video).permit(:captured_at, :content, :duration, :enclosure_url,
      :height, :image_url, :in_reply_to, :private, :published_at, :slug, :subtitle,
      :tags, :title, :width)
  end
end
