class PostsController < ApplicationController
  def index
    @slug = "home"
    @posts = Post.all.paginate(page: params[:page] || 1)
  end
end
