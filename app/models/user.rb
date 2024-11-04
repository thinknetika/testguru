class User < ApplicationRecord
  has_many :tests, dependent: :destroy

  has_many :test_passages, dependent:  :destroy

  has_many :tests, through: :test_passages

  scope :by_level, ->(level) { where(level: level) }

  def tests_by_level(level)
    tests.by_level(level)
  end
end
