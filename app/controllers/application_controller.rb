class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  before_filter :require_login

  private
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:warning] = I18n.t("authentication.login_first")

      redirect_to login_path
    end
  end
end
