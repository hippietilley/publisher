class RootController < ApplicationController
  def index
    if Setting.of("home_page").content.present?
      @post = Post.of(:page).find_by(slug: Setting.of("home_page").content)
    else
      # TODO DRY refactor, duplicated from RootController#index
      @slug = "home"
      @posts = Post.where.not(post_type_type: "Page").for_user(current_user).page(params[:page])
      return render "posts/index"
    end
  end
end
