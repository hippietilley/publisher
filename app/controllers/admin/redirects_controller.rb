class Admin::RedirectsController < ApplicationController
  before_action :authorize
  before_action :set_redirect, only: [:edit, :update, :destroy]
  before_action :all_redirects
  before_action :set_on_admin_page
  layout 'admin'

  def index
    @page_title = 'Redirects Manager'
    @slug = 'redirects'
    @redirects = Redirect.all
  end

  def show
    redirect_to admin_redirects_path
  end

  def new
    @page_title = 'New Redirect'
    @redirect = Redirect.new
  end

  def edit
    @page_title = 'Editing Redirect'
    @slug = 'redirects'
  end

  def create
    @redirect = Redirect.new(redirect_params)

    if @redirect.save
      redirect_to admin_redirects_path, notice: 'Redirect was successfully created.'
    else
      render :new
    end
  end

  def update
    if @redirect.update(redirect_params)
      redirect_to admin_redirects_path, notice: 'Redirect was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @redirect.destroy
    redirect_to admin_redirects_path, notice: 'Redirect was successfully destroyed.'
  end

  private

  def set_redirect
    @redirect = Redirect.find(params[:id])
  end

  def redirect_params
    params.require(:redirect).permit(:source_path, :target_path)
  end

  def all_redirects
      @redirects = Redirect.all
    # TODO: .where(user_id: current_user.id)
  end
end
