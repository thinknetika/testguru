class Test < ApplicationRecord
  belongs_to :category

  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy

  has_many :users, through: :test_passages

  enum level: {
    easy: 0,
    medium: 1,
    hard: 2
  }

  def self.sorted_test_by_category(category_title)
    joins(:category).
      where(categories: { title: category_title }).
      order(title: :desc).
      pluck(:title)
  end
end
