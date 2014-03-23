class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_url, alert: 'Invalid username / password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
