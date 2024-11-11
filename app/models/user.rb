class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :tests, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
