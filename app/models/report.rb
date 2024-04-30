class Report < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :comment
end
