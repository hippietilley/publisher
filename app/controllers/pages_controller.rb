# Everything is called @post instead of @page so that other things Just Work
class PagesController < ApplicationController
  def index
    if signed_in?
      @posts = Post.where(post_type_type: "Page").paginate(page: params[:page]).all
    else
      @posts = Post.visible.where(post_type_type: "Page").paginate(page: params[:page]).all
    end
  end

  def show
    # find old path and redirect to new one
    redirect = Redirect.find_by(source_path: params[:path])
    return redirect_to("/" + redirect.target_path) unless redirect.nil?

    # if no redirect is found, look page or redirect to home
    @post = Post.find_by(slug: params[:path])
    if @post.nil?
      return redirect_to root_path
    else
      return render "/posts/show"
    end
  end
end
