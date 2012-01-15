class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create, :failure]

  def create
    auth_hash = request.env['omniauth.auth']

    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
      redirect_to root_url, :notice => I18n.t("authentication.new_provider", :provider => auth_hash["provider"].capitalize) 
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id

      redirect_to root_url, :notice => I18n.t("authentication.logged_in", :username => auth.user.name)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => I18n.t("authentication.logged_out")
  end

  def failure
    flash[:error] = I18n.t("authentication.not_allowed")

    redirect_to login_path
  end
end
