OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV.fetch('LINKEDIN_KEY'), ENV.fetch('LINKEDIN_SECRET')
end
