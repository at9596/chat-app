module ApplicationHelper
    def show_flash_msg
        msg =   case
                when alert.present?
                alert
                when notice.present?
                notice
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
