class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_user

  expose(:page_slugs ) { Page.select(:slug).map(&:slug) }
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user 
      redirect_to root_path
    end
  end
end
