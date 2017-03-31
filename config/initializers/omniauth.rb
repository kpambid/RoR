OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1874934166120562'], ENV['1ccf1e6702ad3434cd4a845f82253ddf'],
  {:provider_ignores_state => true}
end
