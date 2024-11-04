class User < ApplicationRecord
  has_many :tests, dependent: :destroy

  has_many :test_passages, dependent:  :destroy

  has_many :tests, through: :test_passages

  def tests_by_level(level)
    tests.by_level(level)
  end
end
