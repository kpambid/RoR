class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    host = Host.from_omniauth(request.env["omniauth.auth"])
    if host.persisted?
      sign_in_and_redirect host, notice: "Signed in!"
    else
      redirect_to new_host_path
    end
  end
end
