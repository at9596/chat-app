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
end
