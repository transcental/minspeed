Rails.application.config.middleware.use OmniAuth::Builder do
  provider :hack_club, Rails.application.credentials.dig(:hca, :client_id), Rails.application.credentials.dig(:hca, :client_secret),
    scope: "openid email profile name slack_id"
end

OmniAuth.config.request_validation_phase = OmniAuth::AuthenticityTokenProtection.new(key: :_csrf_token)
OmniAuth.config.allowed_request_methods = [ :post ]
