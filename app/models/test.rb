class Test < ApplicationRecord
  belongs_to :category

  enum level: [ :easy, :medium, :hard ] # указываем уровни сложности

  validates :title, presence: true # проверка на предмет пустой строки, null валидируется на уровне БД
  validates :level, inclusion: { in: levels.values } # проверка на предмет предустановленных уровней сложности
end
