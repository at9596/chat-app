class Comment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :post
  has_many :pictures, as: :imagable
  has_rich_text :content
  has_many :reports

  # Callbacks
  after_create :create_notification
  
   private
    def create_notification
      Notification.create(user: self.user, notifiable: self, notification_type: 'comment')
    end
end
