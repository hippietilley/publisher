class LinksController < ApplicationController
  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :authorize
  before_action :all_links

  def index
    @page_title = "Links"
    @slug = "links"
    @links = Link.all
  end

  def show
    redirect_to links_path
  end

  def new
    @page_title = "New Link"
    @link = Link.new
  end

  def edit
    @page_title = "Editing Link : #{@link.name}"
    @slug = "links"
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to links_url, notice: "Link was successfully created."
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to links_url, notice: "Link was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: "Link was successfully destroyed."
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url,
      :name,
      :user_id)
  end

  def all_links
    @links = Link.where(user_id: current_user.id).all
  end
end
