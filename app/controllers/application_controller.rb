class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_host
    @current_host ||= Host.find(session[:host_id]) if session[:host_id]
  end
  helper_method :current_host

end
