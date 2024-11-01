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
  { title: 'Тест IQ 0', level: :easy, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Тест IQ 1', level: :medium, category_id: categories[0].id, author_id: users[1].id },
  { title: 'Тест Психология 1', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Тест Психология 2', level: 2, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Тест Прозводительность 0', level: 0, category_id: categories[2].id, author_id: users[1].id },
  { title: 'Тест Прозводительность 2', level: 2, category_id: categories[2].id, author_id: users[1].id }
]

tests = Test.create!(tests_collection)

questions_collection = [
  { body: 'Вопрос 1 Тест IQ 0 level 0', test_id: tests[0].id },
  { body: 'Вопрос 2 Тест IQ 0 level 0', test_id: tests[0].id },
  { body: 'Вопрос 1 Тест IQ 1 level 1', test_id: tests[1].id },
  { body: 'Вопрос 2 Тест IQ 1 level 1', test_id: tests[1].id },
  { body: 'Вопрос 1 Тест Психология level 1', test_id: tests[2].id },
  { body: 'Вопрос 2 Тест Психология level 1', test_id: tests[2].id },
  { body: 'Вопрос 1 Тест Психология level 2', test_id: tests[3].id },
  { body: 'Вопрос 2 Тест Психология level 2', test_id: tests[4].id },
  { body: 'Вопрос 1 Тест Прозводительность level 0', test_id: tests[4].id },
  { body: 'Вопрос 2 Тест Прозводительность level 0', test_id: tests[4].id },
  { body: 'Вопрос 1 Тест Прозводительность level 2', test_id: tests[5].id },
  { body: 'Вопрос 2 Тест Прозводительность level 2', test_id: tests[5].id }
]

questions = Question.create!(questions_collection)

answers_collection = [
  { body: 'Ответ 1 на вопрос 1 Тест IQ level 0', question_id: questions[0].id, correct: true },
  { body: 'Ответ 2 на вопрос 1 Тест IQ level 0', question_id: questions[0].id },
  { body: 'Ответ 1 на вопрос 2 Тест IQ level 0', question_id: questions[1].id, correct: true },
  { body: 'Ответ 2 на вопрос 2 Тест IQ level 0', question_id: questions[1].id },
  { body: 'Ответ 1 на вопрос 1 Тест IQ level 1', question_id: questions[2].id, correct: true },
  { body: 'Ответ 2 на вопрос 1 Тест IQ level 1', question_id: questions[2].id },
  { body: 'Ответ 1 на вопрос 2 Тест IQ level 1', question_id: questions[3].id, correct: true },
  { body: 'Ответ 2 на вопрос 2 Тест IQ level 1', question_id: questions[3].id },
  { body: 'Ответ 1 на вопрос 1 Психология level 1', question_id: questions[4].id, correct: true },
  { body: 'Ответ 2 на вопрос 1 Психология level 1', question_id: questions[4].id },
  { body: 'Ответ 1 на вопрос 2 Психология level 1', question_id: questions[5].id, correct: true },
  { body: 'Ответ 2 на вопрос 2 Психология level 1', question_id: questions[5].id },
  { body: 'Ответ 1 на вопрос 1 Психология level 2', question_id: questions[6].id, correct: true },
  { body: 'Ответ 2 на вопрос 1 Психология level 1', question_id: questions[6].id },
  { body: 'Ответ 1 на вопрос 2 Психология level 2', question_id: questions[7].id, correct: true },
  { body: 'Ответ 2 на вопрос 2 Психология level 2', question_id: questions[7].id },
  { body: 'Ответ 1 на вопрос 1 Прозводительность level 0', question_id: questions[8].id, correct: true },
  { body: 'Ответ 2 на вопрос 1 Прозводительность level 0', question_id: questions[8].id },
  { body: 'Ответ 1 на вопрос 2 Прозводительность level 0', question_id: questions[9].id, correct: true },
  { body: 'Ответ 2 на вопрос 2 Прозводительность level 0', question_id: questions[9].id },
  { body: 'Ответ 1 на вопрос 1 Прозводительность level 2', question_id: questions[10].id, correct: true },
  { body: 'Ответ 2 на вопрос 1 Прозводительность level 2', question_id: questions[10].id },
  { body: 'Ответ 1 на вопрос 2 Прозводительность level 2', question_id: questions[11].id, correct: true },
  { body: 'Ответ 2 на вопрос 2 Прозводительность level 2', question_id: questions[11].id }
]

Answer.create!(answers_collection)

test_passages_collection = [
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[4].id },
  { user_id: users[1].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[3].id }
]

TestPassage.create(test_passages_collection)
