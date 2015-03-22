OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '442137515935986', '1c04bd52b45c04ec35de8bc72bbf6af7',
  :scope => 'email'
end