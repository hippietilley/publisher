class Admin::TagsController < ApplicationController
  before_action :authorize
  before_action :set_on_admin_page
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.order("slug ASC").all
    render layout: "admin"
  end

  def show
    render layout: "admin"
  end

  def new
    redirect_to admin_tags_path
  end

  def edit
    render layout: "admin"
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to [:admin, @tag], notice: "Tag was successfully created."
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to [:admin, @tag], notice: "Tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path, notice: "Tag was successfully destroyed."
  end

  private

  def set_tag
    if params[:id] =~ /:/
      namespace, remainder = params[:id].split(":")
      predicate, slug = remainder.split("=")
      @tag = Tag.find_by(namespace: namespace, predicate: predicate, slug: slug)
    else
      @tag = Tag.find_by(slug: params[:id])
    end
  end

  def tag_params
    params.require(:tag).permit(:name, :slug, :namespace, :predicate)
  end
end
