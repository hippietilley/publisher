class NotesController < ApplicationController
  before_action :set_note,  only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /notes
  def index
    if signed_in?
      @posts = Note.all
    else
      @posts = Note.visible.all
    end

    @posts = @posts.sort_by(&:published_at).reverse
  end

  # GET /notes/1
  def show
  end

  # GET /notes/new
  def new
    @post = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    @post = Note.new(note_params)

    if @post.save
      redirect_to @post, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @post.update(note_params)
      redirect_to @post, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notes/1
  def destroy
    @post.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @post = Note.find(params[:id])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:content, :slug, :in_reply_to, :tags, :published_at, :private)
  end
end
