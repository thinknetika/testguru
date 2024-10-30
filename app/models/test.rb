class Test < ApplicationRecord
  enum level: { easy: 0, medium: 1, hard: 2 }, validate: true

  belongs_to :category

  has_many :questions

  validates :title, presence: true

  def self.all_tests(test_category)
    where(category: test_category)
  end
end
