class TokensController < ApplicationController
  def signin
    sign_out(current_user) if user_signed_in?
    resource = User.find_for_database_authentication(email: params[:email])
        if resource&.valid_password?(params[:password])
          sign_in(resource) # This is Devise's sign_in method
          render json: { data: { token: generate_access_token(resource) }, status: 200, message: "Success" }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
  end

  private
  def generate_access_token(user)
    payload = { 
        user_id: user.id,
        exp: (10).hour.from_now.to_i
    }
    token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
    token
end
end
