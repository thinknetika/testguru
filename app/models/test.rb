class Test < ApplicationRecord
  enum level: { easy: 0, medium: 1, hard: 2 }

  belongs_to :category

  belongs_to :author, class_name: "User"

  has_many :questions

  validates :title, presence: true

  def self.all_tests(test_category)
    where(category: test_category)
  end
end
