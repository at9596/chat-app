class ApiController < ApplicationController
    before_action :authenticate_user!
    private
     def authenticate_user!
        begin
            token = request.headers['Authorization']&.split(' ')&.last
            payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')[0]
            @current_user = User.find(payload['user_id'])
        rescue JWT::DecodeError
          render json: { errors: 'Invalid token' }, status: :unauthorized
        end
    end
end
