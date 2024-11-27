class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where correct: true }

  private

  def answers_count
    errors.add(
      :answers_count_error,
      "there can be no more than five answers") if question.answers.count >= 5
  end
end
