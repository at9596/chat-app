class UserMailer < ApplicationMailer
    default from: 'no-reply@example.com',
    return_path: 'system@example.com'
    def welcome(recipient)
        @account = recipient
        mail(to: recipient.email,
             bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"]) do |format|
                format.text
                format.html
             end
      end
end
