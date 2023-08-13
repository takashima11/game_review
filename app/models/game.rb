class Game < ApplicationRecord
  has_one_attached :image
  belongs_to :jenre, optional: true
  has_many :posts, dependent: :destroy
end
