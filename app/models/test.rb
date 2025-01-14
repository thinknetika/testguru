class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where level: 0..1 }
  scope :medium, -> { where level: 2..4 }
  scope :hard, -> { where level: 5..Float::INFINITY }
  scope :by_level, ->(level) { where level: level }
  scope :by_level_and_ids, ->(level, ids) { where(level: level, id: ids) }
  scope :order_by_category_title, ->(category_title) {
    joins(:category).
      where(categories: { title: category_title }).
      order(title: :desc)
  }
  scope :by_category, lambda {
    |id| joins(:category).
      where(categories: { id: }).
      order(title: :desc)
  }

  def self.category_title(category_title)
    order_by_category_title(category_title).pluck(:title)
  end
end
