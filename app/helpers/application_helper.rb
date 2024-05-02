module ApplicationHelper
    def show_flash_msg
        success = flash[:success]
        msg =   case
                when alert.present?
                alert
                when notice.present?
                notice
                when success.present?
                success
                else
                nil  
                end
        return msg
    end

    def notification_count(user)
        notifications = Notification.where(user_id: user.id, viewed: false)
        notifications_count = notifications.count
        return notifications_count.present? ? notifications_count : ''
    end
    
end
