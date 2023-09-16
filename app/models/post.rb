class Post < ApplicationRecord

  belongs_to :game
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :association_post_and_tags, dependent: :destroy
  has_many :tags, through: :association_post_and_tags


  validates :body, presence: true
  validates :star, presence: true

  # scope :published, -> {where(is_published_flag: true)}
  # scope :unpublished, -> {where(is_published_flag: false)}

  enum status: { public: 0, private: 1 }, _prefix: true

  def self.search(keyword)
    where("facility_name LIKE ? or address LIKE ? or detailed_description LIKE ?", "%#{sanitize_sql_like(keyword)}%", "%#{sanitize_sql_like(keyword)}%", "%#{sanitize_sql_like(keyword)}%")
  end

end
