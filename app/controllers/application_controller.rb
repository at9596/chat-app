class ApplicationController < ActionController::Base
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    private

    def user_not_authorized(exception)
        policy_name = exception.policy.class.to_s.underscore
     
        error = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
        redirect_back(fallback_location: root_path, alert: error)
    end
end
