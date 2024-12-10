class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :set_question, on: %i[ create update ]

  before_update :update_passed_status

  scope :passed_tests, -> { where(passed: true) }

  def finished?
    completed? || time_out?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def success?
    test_rate > SUCCESS_PERCENT
  end

  def test_rate
    self.correct_questions.to_f / self.test.questions.count * 100
  end

  def update_passed_status
    self.passed = completed? && success?
  end

  def passed_tests_id
    user.test_passages.passed_tests.pluck(:test_id).uniq
  end

  private

  def completed?
    current_question.nil?
  end

  def time_out?
    return false if test.time_limit == 0

    (Time.zone.now - self.created_at).ceil >= test.time_limit * 60
  end

  def set_question
    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end
end
