class PostsController < ApplicationController
  def index
    @slug = "home"
    @posts = Post.where.not(post_type_type: "Page").all.paginate(page: params[:page] || 1)
  end
end
