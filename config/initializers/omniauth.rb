OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #binding.pry
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_app_secret,
  :scope => 'email', :provider_ignores_state => true

#   OmniAuth.config.on_failure = Proc.new { |env|
#   OmniAuth::FailureEndpoint.new(env).redirect_to_failure
# }

end
