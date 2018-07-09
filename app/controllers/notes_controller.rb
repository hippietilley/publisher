class NotesController < ApplicationController
  before_action :set_note,  only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = 'Notes'
    @posts = Post.of(:note).for_user(current_user).page(params[:page]).all.per_page(15)
    render '/posts/index'
  end

  def show
    @page_title = @post.name
    render '/posts/show'
  end

  def new
    @page_title = "New #{post_class}"
    @post = PostForm.new(post_class)
    render 'posts/new', layout: 'admin'
  end

  def edit
    @page_title = "Editing #{post_class}: #{@post.name}"
    @post = PostForm.new(post_class, @post)
    render 'posts/edit', layout: 'admin'
  end

  def create
    @post = PostForm.new(Note)
    if @post.submit(params[:note])
      save_tags(@post, note_params)
      redirect_to @post.path, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(Note, @post)
    if @post.update(note_params)
      save_tags(@post, note_params)
      redirect_to @post.path, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def post_class
    Note
  end

  def set_note
    @post = Post.of(:note).where(slug: params[:slug]).first
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def note_params
    params.require(:note).permit(:content,
                                 :slug,
                                 :in_reply_to,
                                 :tags,
                                 :published_at,
                                 :private)
  end
end
