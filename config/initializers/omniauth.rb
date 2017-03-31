OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1874934166120562', '1ccf1e6702ad3434cd4a845f82253ddf',
  :scope => 'offline_access', :provider_ignores_state => true

  OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

end
