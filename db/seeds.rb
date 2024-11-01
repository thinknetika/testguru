find_id = proc { |model, attribute, value| model.find_by(attribute => value).id }
create_record = proc { |model, attributes| model.create!(attributes) }

# Коллекции параметров
categories = [
  { title: 'IQ' },
  { title: 'Психология' },
  { title: 'Прозводительность' }
]

users = [
  { nickname: 'user_1', email: 'user_1@mail.ru' },
  { nickname: 'user_2', email: 'user_2@mail.ru' }
]

categories.each { |attrs| create_record.call(Category, attrs) }
users.each { |attrs| create_record.call(User, attrs) }

tests = [
  {
    title: 'Тест IQ 0', level: :easy,
    category_id: find_id.call(Category, :title, categories[0][:title]),
    author_id: find_id.call(User, :nickname, users[0][:nickname])
  },
  { title: 'Тест IQ 1', level: :medium,
    category_id: find_id.call(Category, :title, categories[0][:title]),
    author_id: find_id.call(User, :nickname, users[1][:nickname])
  },
  {
    title: 'Тест Психология 1', level: 1,
    category_id: find_id.call(Category, :title, categories[1][:title]),
    author_id: find_id.call(User, :nickname, users[0][:nickname])
  },
  {
    title: 'Тест Психология 2', level: 2,
    category_id: find_id.call(Category, :title, categories[1][:title]),
    author_id: find_id.call(User, :nickname, users[0][:nickname])
  },
  {
    title: 'Тест Прозводительность 0', level: 0,
    category_id: find_id.call(Category, :title, categories[2][:title]),
    author_id: find_id.call(User, :nickname, users[1][:nickname])
  },
  {
    title: 'Тест Прозводительность 2', level: 2,
    category_id: find_id.call(Category, :title, categories[2][:title]),
    author_id: find_id.call(User, :nickname, users[1][:nickname])
  }
]

tests.each { |attrs| create_record.call(Test, attrs) }

questions = [
  { body: 'Вопрос 1 Тест IQ 0 level 0', test_id: find_id.call(Test, :title, tests[0][:title]) },
  { body: 'Вопрос 2 Тест IQ 0 level 0', test_id: find_id.call(Test, :title, tests[0][:title]) },
  { body: 'Вопрос 1 Тест IQ 1 level 1', test_id: find_id.call(Test, :title, tests[1][:title]) },
  { body: 'Вопрос 2 Тест IQ 1 level 1', test_id: find_id.call(Test, :title, tests[1][:title]) },
  { body: 'Вопрос 1 Тест Психология level 1', test_id: find_id.call(Test, :title, tests[2][:title]) },
  { body: 'Вопрос 2 Тест Психология level 1', test_id: find_id.call(Test, :title, tests[2][:title]) },
  { body: 'Вопрос 1 Тест Психология level 2', test_id: find_id.call(Test, :title, tests[3][:title]) },
  { body: 'Вопрос 2 Тест Психология level 2', test_id: find_id.call(Test, :title, tests[4][:title]) },
  { body: 'Вопрос 1 Тест Прозводительность level 0', test_id: find_id.call(Test, :title, tests[4][:title]) },
  { body: 'Вопрос 2 Тест Прозводительность level 0', test_id: find_id.call(Test, :title, tests[4][:title]) },
  { body: 'Вопрос 1 Тест Прозводительность level 2', test_id: find_id.call(Test, :title, tests[5][:title]) },
  { body: 'Вопрос 2 Тест Прозводительность level 2', test_id: find_id.call(Test, :title, tests[5][:title]) }
]

questions.each { |attrs| create_record.call(Question, attrs) }

answers = [
  { body: 'Ответ 1 на вопрос 1 Тест IQ level 0', question_id: find_id.call(Question, :body, questions[0][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 1 Тест IQ level 0', question_id: find_id.call(Question, :body, questions[0][:body]) },
  { body: 'Ответ 1 на вопрос 2 Тест IQ level 0', question_id: find_id.call(Question, :body, questions[1][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 2 Тест IQ level 0', question_id: find_id.call(Question, :body, questions[1][:body]) },
  { body: 'Ответ 1 на вопрос 1 Тест IQ level 1', question_id: find_id.call(Question, :body, questions[2][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 1 Тест IQ level 1', question_id: find_id.call(Question, :body, questions[2][:body]) },
  { body: 'Ответ 1 на вопрос 2 Тест IQ level 1', question_id: find_id.call(Question, :body, questions[3][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 2 Тест IQ level 1', question_id: find_id.call(Question, :body, questions[3][:body]) },
  { body: 'Ответ 1 на вопрос 1 Психология level 1', question_id: find_id.call(Question, :body, questions[4][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 1 Психология level 1', question_id: find_id.call(Question, :body, questions[4][:body]) },
  { body: 'Ответ 1 на вопрос 2 Психология level 1', question_id: find_id.call(Question, :body, questions[5][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 2 Психология level 1', question_id: find_id.call(Question, :body, questions[5][:body]) },
  { body: 'Ответ 1 на вопрос 1 Психология level 2', question_id: find_id.call(Question, :body, questions[6][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 1 Психология level 1', question_id: find_id.call(Question, :body, questions[6][:body]) },
  { body: 'Ответ 1 на вопрос 2 Психология level 2', question_id: find_id.call(Question, :body, questions[7][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 2 Психология level 2', question_id: find_id.call(Question, :body, questions[7][:body]) },
  { body: 'Ответ 1 на вопрос 1 Прозводительность level 0', question_id: find_id.call(Question, :body, questions[8][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 1 Прозводительность level 0', question_id: find_id.call(Question, :body, questions[8][:body]) },
  { body: 'Ответ 1 на вопрос 2 Прозводительность level 0', question_id: find_id.call(Question, :body, questions[9][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 2 Прозводительность level 0', question_id: find_id.call(Question, :body, questions[9][:body]) },
  { body: 'Ответ 1 на вопрос 1 Прозводительность level 2', question_id: find_id.call(Question, :body, questions[10][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 1 Прозводительность level 2', question_id: find_id.call(Question, :body, questions[10][:body]) },
  { body: 'Ответ 1 на вопрос 2 Прозводительность level 2', question_id: find_id.call(Question, :body, questions[11][:body]), correct: true },
  { body: 'Ответ 2 на вопрос 2 Прозводительность level 2', question_id: find_id.call(Question, :body, questions[11][:body]) }
]

test_passages = [
  { user_id: find_id.call(User, :nickname, users[0][:nickname]), test_id: find_id.call(Test, :title, tests[0][:title]) },
  { user_id: find_id.call(User, :nickname, users[0][:nickname]), test_id: find_id.call(Test, :title, tests[1][:title]) },
  { user_id: find_id.call(User, :nickname, users[0][:nickname]), test_id: find_id.call(Test, :title, tests[4][:title]) },
  { user_id: find_id.call(User, :nickname, users[1][:nickname]), test_id: find_id.call(Test, :title, tests[0][:title]) },
  { user_id: find_id.call(User, :nickname, users[1][:nickname]), test_id: find_id.call(Test, :title, tests[3][:title]) },
]

# Создание записей
answers.each { |attrs| create_record.call(Answer, attrs) }
test_passages.each { |attrs| create_record.call(TestPassage, attrs) }
