class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :comment_content, presence: true
end
