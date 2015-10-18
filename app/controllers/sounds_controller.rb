class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /sounds
  def index
    if signed_in?
      @posts = Sound.all
    else
      @posts = Sound.visible.all
    end

    @posts = @posts.sort_by(&:published_at).reverse
  end

  # GET /sounds/1
  def show
  end

  # GET /sounds/new
  def new
    @post = Sound.new
  end

  # GET /sounds/1/edit
  def edit
  end

  # POST /sounds
  def create
    @post = Sound.new(sound_params)

    if @post.save
      redirect_to @post, notice: 'Sound was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sounds/1
  def update
    if @post.update(sound_params)
      redirect_to @post, notice: 'Sound was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sounds/1
  def destroy
    @post.destroy
    redirect_to sounds_url, notice: 'Sound was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sound
    @post = Sound.find(params[:id])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  # Only allow a trusted parameter "white list" through.
  def sound_params
    params.require(:sound).permit(:title, :subtitle, :content, :slug, :in_reply_to,
      :tags, :published_at, :private, :image_url, :duration, :captured_at, :enclosure_url)
  end
end
