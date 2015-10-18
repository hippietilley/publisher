class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_slug

  private

  def set_slug
    if @slug.blank?
      @slug = controller_name
    else
      @slug
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
end
