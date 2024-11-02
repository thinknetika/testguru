class User < ApplicationRecord
  has_many :tests, dependent: :destroy

  def tests_by_level(level)
    Test.joins("JOIN test_passages ON test_passages.test_id = tests.id").
      where(tests: { level: level }, test_passages: { user_id: id })
  end
end
