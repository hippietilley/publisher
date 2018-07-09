class PostsController < ApplicationController
  before_action :authorize, only: :new

  def index
    redirect_to root_path if Setting.of('home_page').content.blank? && request.path =~ %r{^/posts}

    # TODO: DRY refactor, duplicated in RootController#index
    @slug = 'home'
    @posts = Post.where.not(post_type_type: 'Page').for_user(current_user).page(params[:page])
  end

  def new
    @on_admin_page = true
    render layout: 'admin'
  end
end
