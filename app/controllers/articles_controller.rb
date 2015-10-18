class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /articles
  def index
    if signed_in?
      @posts = Article.all
    else
      @posts = Article.visible.all
    end

    @posts = @posts.sort_by(&:published_at).reverse
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @post = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @post = Article.new(article_params)

    if @post.save
      redirect_to @post, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @post.update(article_params)
      redirect_to @post, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @post.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @post = Article.find(params[:id])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :slug, :in_reply_to, :tags, :published_at, :private)
  end
end
