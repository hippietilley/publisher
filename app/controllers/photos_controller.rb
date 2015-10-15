class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /photos
  def index
    if signed_in?
      @photos = Photo.all
    else
      @photos = Photo.where(private: false)
    end
  end

  # GET /photos/1
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    redirect_to photos_url, notice: 'Photo was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
    return redirect_to(root_path) if @photo.private? && !signed_in?
  end

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:title, :subtitle, :content, :slug, :in_reply_to, :tags, :published_at, :private, :image_url, :width, :height, :captured_at)
  end
end
