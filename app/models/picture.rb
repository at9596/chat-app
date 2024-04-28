class Picture < ApplicationRecord
  has_one_attached :image
  belongs_to :imagable, polymorphic: true
end
