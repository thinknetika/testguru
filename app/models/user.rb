class User < ApplicationRecord
  validates :nickname, presence: true # проверка на предмет пустой строки, null валидируется на уровне БД
  validates :email, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP } # проверка на уникальность,
                                                        # и регулярным выражением
end
