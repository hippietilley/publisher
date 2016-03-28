class PostsController < ApplicationController
  def index
    @slug = "home"
    @posts = Post.where.not(post_type_type: "Page").for_user(current_user).page(params[:page])
  end
  
  def new
    @on_admin_page = true
    render layout: "admin"
  end
end
