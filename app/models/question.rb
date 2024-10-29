class Question < ApplicationRecord
  belongs_to :test

  validates :body, length: { minimum: 20 } # проверка минимального количества символов в вопросе
end
