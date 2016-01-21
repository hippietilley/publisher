class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @posts = Post.of(:sound).for_user(current_user).page(params[:page]).all.per_page(5)
    render "/posts/index"
  end

  def show
    render "/posts/show"
  end

  def new
    @post = PostForm.new(Sound)
  end

  def edit
    @post = PostForm.new(Sound, @post)
  end

  def create
    @post = PostForm.new(Sound)
    if @post.submit(params[:sound])
      save_tags(@post, sound_params)
      redirect_to @post.path, notice: "Sound was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Sound, @post)
    if @post.update(sound_params)
      save_tags(@post, sound_params)
      redirect_to @post.path, notice: "Sound was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to sounds_url, notice: "Sound was successfully destroyed."
  end

  private

  def set_sound
    @post = Post.of(:sound).where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def sound_params
    params.require(:sound).permit(:title, :subtitle, :content, :slug, :in_reply_to,
      :tags, :published_at, :private, :image_url, :duration, :captured_at, :enclosure_url)
  end
end
