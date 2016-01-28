class ProvidersController < ApplicationController

  def create
    @provider = Provider.from_omniauth(request.env['omniauth.auth'])
    @provider.user = current_user
    if @provider.save
      redirect_to root_path, notice: "Auth with #{@provider.provider} successful."
    else
      redirect_to root_path, notice: "Auth with #{@provider.provider} unsuccessful. Try again."
    end
  end
end
