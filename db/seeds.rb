categories_collection = [
  { title: 'Программирование' },
  { title: 'IT' }
]

categories = Category.create!(categories_collection)

User.create!(email: 'user1@mail.ru', password: '123456')

admin_first_name = Rails.application.credentials.administrator[:first_name]
admin_last_name = Rails.application.credentials.administrator[:last_name]
admin_email = Rails.application.credentials.administrator[:email]
admin_password = Rails.application.credentials.administrator[:password]

admin = User.create!(
  first_name: admin_first_name,
  last_name: admin_last_name,
  email: admin_email,
  type: 'Admin',
  password: admin_password)

tests_collection = [
  { title: 'Ruby', level: 1, category: categories[0], author: admin },
  { title: 'Rails', level: 2, category: categories[0], author: admin },
  { title: 'Системное администрирование', level: 4, category: categories[1], author: admin }
]

tests = Test.create!(tests_collection)

questions_collection = [
  { body: 'Какой тип данных используется для представления целых чисел в Ruby?', test: tests[0] },
  { body: 'Что делает метод each в Ruby?', test: tests[0] },
  { body: 'Какой оператор используется для определения блока кода в Ruby?', test: tests[0] },
  { body: 'Что такое nil в Ruby?', test: tests[0] },
  { body: 'Как создать новый массив в Ruby?', test: tests[0] },

  { body: 'Какой из фреймворков используется Rails по умолчанию для работы с базами данных?', test: tests[1] },
  { body: 'Какой метод используется для отображения представления в Rails?', test: tests[1] },
  { body: 'Что такое маршруты (routes) в Rails?', test: tests[1] },
  { body: 'В каком каталоге обычно расположены контроллеры в приложении Rails?', test: tests[1] },
  { body: 'Какой шаблон используется по умолчанию для создания нового Rails приложения?', test: tests[1] },

  { body: 'Какая команда используется для проверки доступности веб-сервера?', test: tests[2] },
  { body: 'Что обозначает аббревиатура SSH?', test: tests[2] },
  { body: 'Какая команда используется для создания новой директории в Linux?', test: tests[2] },
  { body: 'Что делает команда chmod в Linux?', test: tests[2] },
  { body: 'Какая команда используется для просмотра логов системы в Linux?', test: tests[2] }
]

questions = Question.create!(questions_collection)

answers_collection = [
  # Ruby тест
  # Question 1
  { body: 'Float', question: questions[0] },
  { body: 'String', question: questions[0] },
  { body: 'Integer', question: questions[0], correct: true },
  { body: 'Boolean', question: questions[0] },
  { body: 'Array', question: questions[0] },

  # Question 2
  { body: 'Удаляет элемент из массива', question: questions[1] },
  { body: 'Добавляет элемент в массив', question: questions[1] },
  { body: 'Итерирует по элементам массива или другого перечисляемого объекта', question: questions[1], correct: true },
  { body: 'Сортирует массив', question: questions[1] },
  { body: 'Создает новый массив', question: questions[1] },

  # Question 3
  { body: '{}', question: questions[2] },
  { body: '()', question: questions[2] },
  { body: '[]', question: questions[2] },
  { body: 'do...end', question: questions[2], correct: true },
  { body: 'if...else', question: questions[2] },

  # Question 4
  { body: 'Логическое значение “истина”', question: questions[3] },
  { body: 'Логическое значение “ложь”', question: questions[3] },
  { body: 'Пустой массив', question: questions[3] },
  { body: 'Пустая строка', question: questions[3] },
  { body: 'Отсутствие значения', question: questions[3], correct: true },

  # Question 5
  { body: 'Array()', question: questions[4] },
  { body: 'new Array', question: questions[4] },
  { body: '[]', question: questions[4] },
  { body: 'Array.new', question: questions[4] },
  { body: 'Все ответы верны', question: questions[4], correct: true },

  # Rails тест
  # Question 6
  { body: 'MongoDB', question: questions[5] },
  { body: 'Cassandra', question: questions[5] },
  { body: 'Active Record', question: questions[5], correct: true },
  { body: 'PostgreSQL', question: questions[5] },
  { body: 'MySQL', question: questions[5] },

  # Question 7
  { body: 'render', question: questions[6], correct: true },
  { body: 'display', question: questions[6] },
  { body: 'show', question: questions[6] },
  { body: 'view', question: questions[6] },
  { body: 'present', question: questions[6] },

  # Question 8
  { body: 'Файлы, содержащие код контроллеров', question: questions[7] },
  { body: 'Файлы, содержащие код представлений', question: questions[7] },
  { body: 'Правила, определяющие, как URL-адреса сопоставляются с контроллерами и действиями', question: questions[7], correct: true },
  { body: 'Базы данных приложения', question: questions[7] },
  { body: 'Настройки сервера', question: questions[7] },

  # Question 9
  { body: 'app/models', question: questions[8] },
  { body: 'app/views', question: questions[8] },
  { body: 'app/controllers', question: questions[8], correct: true },
  { body: 'app/helpers', question: questions[8] },
  { body: 'config/routes', question: questions[8] },

  # Question 10
  { body: 'rails build myapp', question: questions[9] },
  { body: 'rails cookie myapp', question: questions[9] },
  { body: 'rails new myapp', question: questions[9], correct: true },
  { body: 'rails generate app myapp', question: questions[9] },
  { body: 'rails create myapp', question: questions[9] },

  # Системное администрирование тест
  # Question 11
  { body: 'ping', question: questions[10], correct: true },
  { body: 'traceroute', question: questions[10] },
  { body: 'netstat', question: questions[10] },
  { body: 'curl', question: questions[10] },
  { body: 'telnet', question: questions[10] },

  # Question 12
  { body: 'Secure Shell', question: questions[11], correct: true },
  { body: 'Simple Shell', question: questions[11] },
  { body: 'Super Shell', question: questions[11] },
  { body: 'Secure Socket', question: questions[11] },
  { body: 'Simple Socket', question: questions[11] },

  # Question 13
  { body: 'touch', question: questions[12] },
  { body: 'mkdir', question: questions[12], correct: true },
  { body: 'rmdir', question: questions[12] },
  { body: 'cp', question: questions[12] },
  { body: 'mv', question: questions[12] },

  # Question 14
  { body: 'Копирует файлы', question: questions[13] },
  { body: 'Перемещает файлы', question: questions[13] },
  { body: 'Изменяет права доступа к файлам', question: questions[13], correct: true },
  { body: 'Удаляет файлы', question: questions[13] },
  { body: 'Создает файлы', question: questions[13] },

  # Question 15
  { body: 'cat /etc/passwd', question: questions[14] },
  { body: 'tail -f /var/log/syslog', question: questions[14], correct: true },
  { body: 'ls -al /var/log', question: questions[14] },
  { body: 'df -h', question: questions[14] },
  { body: 'top', question: questions[14] }
]

Answer.create!(answers_collection)
