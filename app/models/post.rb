class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :reports
    has_many :pictures, as: :imagable
    has_rich_text :content
end
