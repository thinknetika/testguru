class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_count, on: :create

  scope :correct_answers, -> { where correct: true }

  private

  def answers_count
    errors.add(
      :answers_count_error,
      "there can be no more than four answers") if question.answers.count >= 4
  end
end
