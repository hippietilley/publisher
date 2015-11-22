class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def index
    if signed_in?
      @posts = Post.where(post_type_type: post_type_type).paginate(page: params[:page]).all
    else
      @posts = Post.where(post_type_type: post_type_type).where.not(private: true).paginate(page: params[:page]).all
    end

    if on_page?
      render "/pages/index"
    else
      render "/posts/index"
    end
  end

  def show
    render "/posts/show"
  end

  def new
    @post = PostForm.new(post_class)
  end

  def edit
    @post = PostForm.new(post_class, @post)
  end

  def create
    @post = PostForm.new(post_class)
    if @post.submit(params[:article])
      save_tags(@post, article_params)
      redirect_to @post.post.path, notice: "#{post_type_type} was successfully created."
    else
      render :new
    end
  end

  def update
    @post = PostForm.new(post_class, @post)
    if @post.update(article_params)
      save_tags(@post, article_params)
      redirect_to @post.path, notice: "#{post_type_type} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    delete_tags(@post)
    @post.destroy
    redirect_to articles_url, notice: "#{post_type_type} was successfully destroyed."
  end

  private

  def on_page?
    unless (@post.present? && @post.post_type_type == "Article") ||
       (@posts.present? && @posts.first.post_type_type == "Article") ||
       request.path.split("/")[1] == "articles"
      true
    end
  end
  helper_method :on_page?

  def post_type_type
    on_page? ? "Page" : "Article"
  end

  def post_class
    on_page? ? Page : Article
  end

  def set_article
    @post = Post.find_by(slug: params[:slug])
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
