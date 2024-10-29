class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, length: { minimum: 20 } # проверка минимального количества символов в вопросе
end
