class ActivitiesController < ApplicationController
  before_action :set_activity,  only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @posts = Post.for_user(current_user).of(:activity).page(params[:page]).all
    render "/posts/index"
  end

  def show
    render "/posts/show"
  end

  def new
    @post = PostForm.new(Activity)
  end

  def edit
    @post = PostForm.new(Activity, @post)
  end

  def create
    @post = PostForm.new(Activity)
    if @post.submit(params[:activity])
      # save_tags(@post, activity_params)
      redirect_to @post.path, notice: "Activity was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Activity, @post)
    if @post.update(activity_params)
      # save_tags(@post, activity_params)
      redirect_to @post.path, notice: "Activity was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to activities_url, notice: "Activity was successfully destroyed."
  end

  private

  def set_activity
    @post = Post.of(:activity).where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def activity_params
    params.require(:activity).permit(:activity_type,
      :activity_verb,
      :amount,
      :unit,
      :converted_amount,
      :converted_unit,
      :starts_at,
      :ends_at)
  end
end
