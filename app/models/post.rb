class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :game
  
  validates :body, presence: true

end
