class Question < ApplicationRecord
  validates :body, length: { minimum: 20 }
end
