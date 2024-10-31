class User < ApplicationRecord
  has_many :tests

  has_many :test_passages

  has_many :tests, through: :test_passages

  validates :nickname, presence: true

  validates :email, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    Test.joins(:test_passages).where(test_passages: { user_id: id }, tests: { level: level })
  end
end
