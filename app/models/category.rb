class Category < ApplicationRecord
  validates :title, presence: true # проверка на предмет пустой строки, null валидируется на уровне БД
end
