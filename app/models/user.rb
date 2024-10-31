class User < ApplicationRecord
  has_many :tests

  validates :nickname, presence: true

  validates :email, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  def tests_by_level(level)
    Test.where(level: level).where(user: id)
  end
end
