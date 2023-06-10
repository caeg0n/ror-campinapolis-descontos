module JwtHelper
  def generate_jwt_token(payload)
    secret_key = Rails.application.credentials.jwt_secret_key.to_s
    JWT.encode(payload,secret_key,'HS256')
  end
end