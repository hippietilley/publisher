class DashboardController < ApplicationController
  before_action :authorize
  before_action :set_on_admin_page
  layout 'admin'

  def new
    @page_title = 'NEW Post'
    @slug       = 'new'

    @activity = PostForm.new(Activity)
    @article  = PostForm.new(Article)
    @bookmark = PostForm.new(Bookmark)
    @event    = PostForm.new(Event)
    @note     = PostForm.new(Note)
    @page     = PostForm.new(Page)
    @photo    = PostForm.new(Photo)
    @sound    = PostForm.new(Sound)
    @video    = PostForm.new(Video)
  end

  def index
    @page_title = 'Dashboard'
    @slug       = 'dashboard'
  end
end
