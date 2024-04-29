module NotificationsHelper
    def update_notification(notification)
        notification.update(viewed: true)
    end
end
