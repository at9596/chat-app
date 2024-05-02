class User < ApplicationRecord
  has_one_attached :image
  after_create :assign_default_role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  
  has_many :comments,dependent: :destroy
  has_one :user_profile
  has_many :posts
  has_many :notifications

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
