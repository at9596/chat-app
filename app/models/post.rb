class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :pictures, as: :imagable
    has_rich_text :content
end
