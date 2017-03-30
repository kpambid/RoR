OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1874934166120562', '1ccf1e6702ad3434cd4a845f82253ddf', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
