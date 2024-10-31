class Test < ApplicationRecord
  enum level: { easy: 0, medium: 1, hard: 2 }

  belongs_to :category

  belongs_to :author, class_name: "User"

  has_many :questions

  has_many :test_passages

  has_many :users, through: :test_passage

  validates :title, presence: true

  def self.tests_title(category)
    where(category: category).order(title: :desc).pluck(:title)
  end
end
