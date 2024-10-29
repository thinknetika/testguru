class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true # проверка на предмет пустой строки, null валидируется на уровне БД
end
