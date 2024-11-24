class Badge < ApplicationRecord
  RULES = %i[attempt category level].freeze

  has_one_attached :image

  has_many :user_badges, dependent: :destroy
  has_many :user, through: :user_badges

  validates :title, :rule_value, :rule_name, presence: true
end
