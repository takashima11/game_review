class Jenre < ApplicationRecord
  has_many :game, dependent: :destroy
end
