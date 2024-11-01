class Test < ApplicationRecord
  enum level: { easy: 0, medium: 1, hard: 2 }

  validates :title, presence: true

  def self.tests_title(category)
    where(category: category).order(title: :desc).pluck(:title)
  end
end
