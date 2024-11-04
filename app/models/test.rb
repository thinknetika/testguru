class Test < ApplicationRecord
  belongs_to :category

  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy

  has_many :users, through: :test_passages

  scope :easy, -> { where level: 0..1 }

  scope :medium, -> { where level: 2..4 }

  scope :hard, -> { where level: 5..Float::INFINITY }


  def self.sorted_test_by_category(category_title)
    joins(:category).
      where(categories: { title: category_title }).
      order(title: :desc).
      pluck(:title)
  end
end
