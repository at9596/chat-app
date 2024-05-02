# app/services/token_generator.rb
class TokenGenerator
    def self.encode(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end
  end