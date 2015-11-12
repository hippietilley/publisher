class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Sound.all
    else
      @posts = Sound.visible.all
    end
  end

  def show
  end

  def new
    @post = PostForm.new(Sound)
  end

  def edit
  end

  def create
    @post = PostForm.new(Sound)

    if @post.submit(params[:sound])
      redirect_to @post.post.path, notice: "Sound was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(sound_params)
      redirect_to @post.path, notice: "Sound was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to sounds_url, notice: "Sound was successfully destroyed."
  end

  private

  def set_sound
    @post = Post.where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def sound_params
    params.require(:sound).permit(:title, :subtitle, :content, :slug, :in_reply_to,
      :tags, :published_at, :private, :image_url, :duration, :captured_at, :enclosure_url)
  end
end
