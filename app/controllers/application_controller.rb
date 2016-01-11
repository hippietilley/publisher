class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_slug
  before_action :set_owner
  before_action :set_page_links

  private

  def split_tags(tags)
    output = []
    tags = tags.gsub(/"|'/, ",")
    separator = tags.match(/,/) ? "," : " "

    tags.split(separator).each do |tag|
      t = tag.strip.gsub(/"|'/, "")
      output << t unless t.blank?
    end

    output.uniq
  end
  helper_method :split_tags

  def set_owner
    @owner = User.first
  end

  def set_slug
    if @slug.blank?
      @slug = controller_name
    else
      @slug
    end
  end

  def set_page_links
    if signed_in?
      all_page_links = Post.of("Page").all
    else
      all_page_links = Post.of("Page").where.not(private: true).all
    end

    @page_links = []
    all_page_links.each do |page|
      @page_links << page if page.post_type.show_in_nav?
    end
  end

  def allow_signup?
    User.count.zero?
  end
  helper_method :allow_signup?

  def signed_in?
    current_user
  end
  helper_method :signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to signin_url, alert: "Not authorized" unless signed_in?
  end

  def add_private_tag(post_params, tag_params)
    tag_params += ", .private, " unless post_params["private"].to_i.zero?
    tag_params
  end

  def delete_tags(post)
    Tagging.where(post_id: post.id, post_type: post.class.to_s.downcase).destroy_all
  end

  def save_tags(post, post_params)
    delete_tags(post)
    add_private_tag(params[:tags], post_params)

    split_tags(params[:tags]).each do |name|
      tag = Tag.find_or_initialize_by(name: name)
      tag.save!

      Tagging.create!(post_id: post.post_type_id, post_type: post.post_type_type.downcase, tag_id: tag.id)
    end
  end
end
