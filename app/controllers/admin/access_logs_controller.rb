class Admin::AccessLogsController < ApplicationController
    def index
        authorize current_user, policy_class: Admin::AccessLogPolicy        # Authorize the index action for AccessLog
      @access_logs = AccessLog.all
    end
  end
  