OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '215828031872830', '398cab17dea9354442a3deed52039d4f'
end