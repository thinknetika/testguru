class Test < ApplicationRecord
  enum level: { easy: 0, medium: 1, hard: 2 }

  def self.sorted_test_by_category(category_title)
    category_id = Category.find_by(title: category_title).id

    where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end
