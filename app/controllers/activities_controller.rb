class ActivitiesController < ApplicationController
  before_action :set_activity,  only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = "Activities"
    @posts = Post.for_user(current_user).of(:activity).page(params[:page]).all
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
    @post = PostForm.new(post_class)
    if @post.submit(params[:activity])
      # save_tags(@post, activity_params)
      redirect_to @post.path, notice: "#{post_class.to_s} was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(post_class, @post)
    if @post.update(activity_params)
      # save_tags(@post, activity_params)
      redirect_to @post.path, notice: "#{post_class.to_s} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to activities_url, notice: "#{post_class.to_s} was successfully destroyed."
  end

  private
  
  def post_class
    Activity
  end

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
