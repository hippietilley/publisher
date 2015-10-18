class PostsController < ApplicationController
  def index
    @slug = "home"
    @posts = [Article.all,
              Note.all,
              Photo.all,
              Bookmark.all,
              Sound.all,
              Video.all
             ].flatten.sort_by(&:published_at).reverse
  end
end
