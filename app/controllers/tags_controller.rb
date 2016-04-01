class TagsController < ApplicationController
  before_action :authorize, except: [:show, :index]
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :set_on_admin_page, except: [:show, :index]

  def index
    @tags = []

    Tag.all.each do |tag|
      if signed_in?
        @tags << tag
      elsif tag.public_tag?
        @tags << tag
      end
    end

    @tags.sort_by! { |tag| tag.name.downcase }
  end

  def show
  end

  def new
    redirect_to tags_path
  end

  def edit
    render layout: "admin"
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag, notice: "Tag was successfully created."
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: "Tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "Tag was successfully destroyed."
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
    
    return redirect_to(tags_path) unless @tag.public_tag? || signed_in?
  end

  def tag_params
    params.require(:tag).permit(:name, :slug, :namespace, :predicate)
  end
end
