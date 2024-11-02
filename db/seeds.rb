categories_collection = [
  { title: 'IQ' },
  { title: 'Психология' },
  { title: 'Прозводительность' }
]

categories = Category.create!(categories_collection)

users_collection = [
  { nickname: 'user_1', email: 'user_1@mail.ru' },
  { nickname: 'user_2', email: 'user_2@mail.ru' }
]

users = User.create!(users_collection)

tests_collection = [
  { title: 'Тест IQ 0', level: :easy, category: categories[0], author: users[0] },
  { title: 'Тест IQ 1', level: :medium, category: categories[0], author: users[1] },
  { title: 'Тест Психология 1', level: 1, category: categories[1], author: users[0] },
  { title: 'Тест Психология 2', level: 2, category: categories[1], author: users[0] },
  { title: 'Тест Прозводительность 0', level: 0, category: categories[2], author: users[1] },
  { title: 'Тест Прозводительность 2', level: 2, category: categories[2], author: users[1] }
]

tests = Test.create!(tests_collection)

questions_collection = [
  { body: 'Вопрос 1 Тест IQ 0 level 0', test: tests[0] },
  { body: 'Вопрос 2 Тест IQ 0 level 0', test: tests[0] },
  { body: 'Вопрос 1 Тест IQ 1 level 1', test: tests[1] },
  { body: 'Вопрос 2 Тест IQ 1 level 1', test: tests[1] },
  { body: 'Вопрос 1 Тест Психология level 1', test: tests[2] },
  { body: 'Вопрос 2 Тест Психология level 1', test: tests[2] },
  { body: 'Вопрос 1 Тест Психология level 2', test: tests[3] },
  { body: 'Вопрос 2 Тест Психология level 2', test: tests[4] },
  { body: 'Вопрос 1 Тест Прозводительность level 0', test: tests[4] },
  { body: 'Вопрос 2 Тест Прозводительность level 0', test: tests[4] },
  { body: 'Вопрос 1 Тест Прозводительность level 2', test: tests[5] },
  { body: 'Вопрос 2 Тест Прозводительность level 2', test: tests[5] }
]

questions = Question.create!(questions_collection)

answers_collection = [
  { body: 'Ответ 1 на вопрос 1 Тест IQ level 0', question: questions[0], correct: true },
  { body: 'Ответ 2 на вопрос 1 Тест IQ level 0', question: questions[0] },
  { body: 'Ответ 1 на вопрос 2 Тест IQ level 0', question: questions[1], correct: true },
  { body: 'Ответ 2 на вопрос 2 Тест IQ level 0', question: questions[1] },
  { body: 'Ответ 1 на вопрос 1 Тест IQ level 1', question: questions[2], correct: true },
  { body: 'Ответ 2 на вопрос 1 Тест IQ level 1', question: questions[2] },
  { body: 'Ответ 1 на вопрос 2 Тест IQ level 1', question: questions[3], correct: true },
  { body: 'Ответ 2 на вопрос 2 Тест IQ level 1', question: questions[3] },
  { body: 'Ответ 1 на вопрос 1 Психология level 1', question: questions[4], correct: true },
  { body: 'Ответ 2 на вопрос 1 Психология level 1', question: questions[4] },
  { body: 'Ответ 1 на вопрос 2 Психология level 1', question: questions[5], correct: true },
  { body: 'Ответ 2 на вопрос 2 Психология level 1', question: questions[5] },
  { body: 'Ответ 1 на вопрос 1 Психология level 2', question: questions[6], correct: true },
  { body: 'Ответ 2 на вопрос 1 Психология level 1', question: questions[6] },
  { body: 'Ответ 1 на вопрос 2 Психология level 2', question: questions[7], correct: true },
  { body: 'Ответ 2 на вопрос 2 Психология level 2', question: questions[7] },
  { body: 'Ответ 1 на вопрос 1 Прозводительность level 0', question: questions[8], correct: true },
  { body: 'Ответ 2 на вопрос 1 Прозводительность level 0', question: questions[8] },
  { body: 'Ответ 1 на вопрос 2 Прозводительность level 0', question: questions[9], correct: true },
  { body: 'Ответ 2 на вопрос 2 Прозводительность level 0', question: questions[9] },
  { body: 'Ответ 1 на вопрос 1 Прозводительность level 2', question: questions[10], correct: true },
  { body: 'Ответ 2 на вопрос 1 Прозводительность level 2', question: questions[10] },
  { body: 'Ответ 1 на вопрос 2 Прозводительность level 2', question: questions[11], correct: true },
  { body: 'Ответ 2 на вопрос 2 Прозводительность level 2', question: questions[11] }
]

Answer.create!(answers_collection)

first_user = users[0]
second_user = users[1]

[ tests[0], tests[1], tests[4] ].each { |test| first_user.tests.push(test) }
[ tests[0], tests[3] ].each { |test| second_user.tests.push(test) }
