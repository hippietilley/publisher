class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    @page_title = "Articles"
    @posts = Post.of(:article).for_user(current_user).page(params[:page]).all.per_page(5)
    render "/posts/index"
  end

  def show
    @page_title = @post.name
    render "/posts/show"
  end

  def new
    @page_title = "New #{post_class.to_s}"
    @post = PostForm.new(post_class)
    render layout: "admin"
  end

  def edit
    @page_title = "Editing #{post_class.to_s}: #{@post.name}"
    @post = PostForm.new(post_class, @post)
    render "posts/edit", layout: "admin"
  end

  def create
    @post = PostForm.new(post_class, @post)
    if @post.submit(params.require(:article))
      save_tags(@post, article_params)
      redirect_to @post.path, notice: "#{post_class} was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(post_class, @post)
    if @post.update(article_params)
      save_tags(@post, article_params)
      redirect_to @post.path, notice: "#{post_class} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to articles_url, notice: "#{post_class} was successfully destroyed."
  end

  private

  def post_type_type
    on_page? ? "Page" : "Article"
  end

  def post_class
    on_page? ? Page : Article
  end
  helper_method :post_class

  def set_article
    @post = Post.of(:article).find_by(slug: params[:slug])
    return redirect_to(root_path) if @post.private? && !signed_in?
  end

  def article_params
    params.require(:article).permit(:title,
      :subtitle,
      :content,
      :slug,
      :show_in_nav,
      :in_reply_to,
      :tags,
      :published_at,
      :private)
  end
end
