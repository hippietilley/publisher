class RootController < ApplicationController
  def index
    if setting("home_page").present?

      @post = Post.of(:page).find_by(slug: setting("home_page"))

      # no layout
      if @post.post_type.hide_layout?
        render text: @post.content, layout: false
      else
        @page_title = @post.name
        render "/posts/show"
      end

    else

      # TODO DRY refactor, duplicated from RootController#index
      @slug = "home"
      @posts = Post.where.not(post_type_type: "Page").for_user(current_user).page(params[:page])
      return render "posts/index"

    end
  end
end
