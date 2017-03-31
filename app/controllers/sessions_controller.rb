class SessionsController < ApplicationController
  def create
    host = Host.from_omniauth(env["omniauth.auth"])
    session[:host_id] = host.id
    redirect_to root_url
  end

  def destroy
    session[:host_id] = nil
    redirect_to root_url
  end
end
