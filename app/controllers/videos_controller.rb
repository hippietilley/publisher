class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, except: [:show, :index]

  # GET /videos
  def index
    if signed_in?
      @videos = Video.all
    else
      @videos = Video.where(private: false)
    end    
  end

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
      if @video.private? && !signed_in?
        return redirect_to(root_path)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      params.require(:video).permit(:title, :subtitle, :content, :slug, :in_reply_to, :tags, :published_at, :private, :image_url, :width, :height, :duration, :captured_at, :enclosure_url)
    end
end
