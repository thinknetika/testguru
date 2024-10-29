class Answer < ApplicationRecord
  belongs_to :question

  validates :body, length: { minimum: 5 } # проверка минимального количества символов в ответе
end
