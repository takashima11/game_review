class Jenre < ApplicationRecord
  has_many :jenre, dependent: :destroy
end
