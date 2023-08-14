class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :game
  has_many :comments, dependent: :destroy

  validates :body, presence: true

end
