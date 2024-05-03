class User < ApplicationRecord
   # Associations
   has_one_attached :image
   has_one :user_profile
   has_many :comments, dependent: :destroy
   has_many :posts
   has_many :notifications
   has_many :access_logs

  # Devise modules
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:google_oauth2]
  # Rolify
  rolify

  # Callbacks
  after_create :assign_default_role
  
  # Methods
  def admin?
   self.roles.map(&:name).include?("admin")
  end

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.id).first_or_create do|user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.full_name = auth.info.name 
        user.image_url = auth.info.image
      end
    end
  end
  
  private

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
