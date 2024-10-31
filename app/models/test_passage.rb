class TestPassage < ApplicationRecord
  enum status: {
    in_progress: 0,
    completed: 1
  }

  belongs_to :user
  belongs_to :test
end
