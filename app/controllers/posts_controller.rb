class PostsController < ApplicationController
  def index
    @slug = "home"

    if signed_in?
      @posts = Post.where.not(post_type_type: "Page").all.paginate(page: params[:page])
    else
      @posts = Post.where.not(post_type_type: "Page").visible.all.paginate(page: params[:page])
    end
  end
end
