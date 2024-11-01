class Answer < ApplicationRecord
  validates :body, length: { minimum: 5 }
end
