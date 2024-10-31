class User < ApplicationRecord
  has_many :tests

  validates :nickname, presence: true

  validates :email, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  def tests(params = [])
    return tests if params.empty?

    key, value = params

    tests.where(key => value)
  end
end
