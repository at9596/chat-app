class TokensController < ApplicationController
  def signin
    if user_signed_in?
      access_log = current_user.access_logs.last
      access_log.update(logout_time: Time.zone.now)
      sign_out(current_user) 
    end
    resource = User.find_for_database_authentication(email: params[:email])
        if resource&.valid_password?(params[:password])
          sign_in(resource) # This is Devise's sign_in method
          # Access Logs
          create_access_logs(resource)
          render json: { data: { token: generate_access_token(resource) }, status: 200, message: "Success" }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
  end

  private

  def create_access_logs(resource)
    user_agent_obj = UserAgent.parse(request.user_agent)
      access_logs_params = {
        ip_address: request.ip,
        browser: user_agent_obj.browser,
        user_id: resource.id,
        login_with: "Web",
        login_time: Time.zone.now
      }
      CreateAccessLogJob.perform_async(access_logs_params.as_json)
  end
  def generate_access_token(user)
    payload = { 
        user_id: user.id,
        exp: (10).hour.from_now.to_i
    }
    token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
    token
end
end
