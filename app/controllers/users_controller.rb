class UsersController < ApplicationController
  before_action :set_user,  only: [:show, :update, :destroy]
  before_filter :authorize, only: [:edit, :update, :destroy]


  # /signup
  def new
    if current_user
      return redirect_to root_url
    else
      @user = User.new
    end
  end

  # /signup
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end


  # GET /users
  # TODO: ADMIN ONLY
  def index
    @users = User.all
  end

  # GET /users/1
  # TODO: hide id in URL, use @username
  def show
  end

  # /settings
  def edit
    @user  = current_user
  end

  # /settings
  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to root_url, notice: "Your settings were successfully updated."
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to root_url, notice: "User was successfully destroyed."
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email,
                                   :password,
                                   :password_confirmation)
    end
end
