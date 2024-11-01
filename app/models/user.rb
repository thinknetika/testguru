class User < ApplicationRecord
  validates :nickname, presence: true

  validates :email, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    Test.joins(:test_passages).where(test_passages: { user_id: id }, tests: { level: level })
  end
end
