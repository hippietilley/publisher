class PostsController < ApplicationController
  def index
    @slug = "home"
    @posts = Post.all
  end
end
