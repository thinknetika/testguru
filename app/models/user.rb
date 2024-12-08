class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :create_tests, class_name: "Test", foreign_key: :author_id, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  has_many :gist, dependent: :destroy

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def names_present?
    !first_name.blank? && !last_name.blank?
  end
end
