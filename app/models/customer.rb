class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲストユーザー"
      user.first_name = "ゲストユーザー"
      user.last_name_kana = "ゲストユーザー"
      user.first_name_kana = "ゲストユーザー"
      user.nickname = "ゲストユーザー"
      user.date_of_birth = "2023/08/05"
      user.gender = "不明"

    end
  end

end
