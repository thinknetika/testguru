class Test < ApplicationRecord
  belongs_to :category

  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy

  enum level: {
    easy: 0,
    medium: 1,
    hard: 2
  }

  def self.sorted_test_by_category(category_title)
    joins("JOIN categories ON categories.id = tests.category_id").
      where(categories: { title: category_title }).
      order(title: :desc).
      pluck(:title)
  end
end
