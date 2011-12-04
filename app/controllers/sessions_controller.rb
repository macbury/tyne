class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create, :failure]

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
      redirect_to root_url, :notice => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id

      redirect_to root_url, :notice => "Hi #{auth.user.name}! You've succesfully logged in."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Signed out!"
  end

  def failure
    flash[:error] = "Sorry, but you didn't allow access to our app!"

    redirect_to login_path
  end
end
