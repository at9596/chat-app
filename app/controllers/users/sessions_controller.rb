# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
     # Access Logs
    create_access_logs(current_user)
    super
  end

  # DELETE /resource/sign_out
  def destroy
     access_log = current_user.access_logs.where(logout_time: nil).last
     access_log&.update(logout_time: Time.zone.now)
    super
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
  def after_sign_in_path_for(_resource_or_scope)
    stored_location_for(_resource_or_scope) || root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
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
end
