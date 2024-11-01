class Test < ApplicationRecord
  enum level: { easy: 0, medium: 1, hard: 2 }

  def self.sorted_test_by_category(category_title)
    joins("JOIN categories ON categories.id = tests.category_id").
      # joins("JOIN categories ON categories.id = tests.category_id AND categories.title = ?", category_title).
      # where("categories.title = ?", category_title).
      where(categories: { title: category_title }).
      order(title: :desc).
      pluck(:title)
  end
end
