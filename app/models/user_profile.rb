class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imagable
end
