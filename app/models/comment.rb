class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :pictures, as: :imagable
  has_rich_text :content
end
