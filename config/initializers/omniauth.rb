Rails.application.config.middleware.use OmniAuth::Builder do
  provider :hack_club, Rails.application.credentials.dig(:hca, :client_id), Rails.application.credentials.dig(:hca, :client_secret),
    scope: "openid email profile slack_id"
end
