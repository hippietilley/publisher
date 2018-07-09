class UsersController < ApplicationController
  before_action :set_user,  only: [:edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]
  before_action :set_on_admin_page
  layout 'admin'

  # /signup
  def new
    return redirect_to root_url if signed_in?

    @page_title = 'Sign Up'
    @slug       = 'signup'

    unless allow_signup?
      flash.alert = 'Contact the owner of this website to request an account.'
      return redirect_to root_url
    end

    @user = User.new
  end

  # /signup
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  # /profile
  def edit
    @page_title    = 'Profile Settings'
    @slug          = 'profile'
  end

  # /profile
  def update
    if current_user.update(user_params)
      redirect_to root_url, notice: 'Your settings were successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email,
                                 :phone,
                                 :password,
                                 :password_confirmation,
                                 :avatar,
                                 :name,
                                 :url)
  end
end
