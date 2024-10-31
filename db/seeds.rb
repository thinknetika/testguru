category_1 = Category.create!(title: 'IQ')
category_2 = Category.create!(title: 'Психология')
category_3 = Category.create!(title: 'Прозводительность')

user_1 = User.create!(nickname: 'user_1', email: 'user_1@mail.ru')
user_2 = User.create!(nickname: 'user_2', email: 'user_2@mail.ru')

test_1 = Test.create!(title: 'Тест IQ 0', level: :easy, category: category_1, author: user_1)
test_2 = Test.create!(title: 'Тест IQ 1', level: :medium, category: category_1, author: user_2)

test_3 = Test.create(title: 'Тест Психология 1', level: 1, category: category_2, author: user_1)
test_4 = Test.create(title: 'Тест Психология 2', level: 2, category: category_2, author: user_1)

test_5 = Test.create(title: 'Тест Прозводительность 0', level: 0, category: category_3, author: user_2)
test_6 = Test.create(title: 'Тест Прозводительность 2', level: 2, category: category_3, author: user_2)

question_1_1 = Question.create(body: 'Вопрос 1 Тест IQ 0 level 0', test: test_1)
question_1_2 = Question.create(body: 'Вопрос 2 Тест IQ 0 level 0', test: test_1)

question_2_1 = Question.create(body: 'Вопрос 1 Тест IQ 1 level 1', test: test_2)
question_2_2 = Question.create(body: 'Вопрос 2 Тест IQ 1 level 1', test: test_2)

question_3_1 = Question.create(body: 'Вопрос 1 Тест Психология level 1', test: test_3)
question_3_2 = Question.create(body: 'Вопрос 2 Тест Психология level 1', test: test_3)

question_4_1 = Question.create(body: 'Вопрос 1 Тест Психология level 2', test: test_4)
question_4_2 = Question.create(body: 'Вопрос 2 Тест Психология level 2', test: test_4)

question_5_1 = Question.create(body: 'Вопрос 1 Тест Прозводительность level 0', test: test_5)
question_5_2 = Question.create(body: 'Вопрос 2 Тест Прозводительность level 0', test: test_5)

question_6_1 = Question.create(body: 'Вопрос 1 Тест Прозводительность level 2', test: test_6)
question_6_2 = Question.create(body: 'Вопрос 2 Тест Прозводительность level 2', test: test_6)

# Тест IQ
Answer.create(body: 'Ответ 1 на вопрос 1 Тест IQ level 0', question: question_1_1, correct: true)
Answer.create(body: 'Ответ 2 на вопрос 1 Тест IQ level 0', question: question_1_1)

Answer.create(body: 'Ответ 1 на вопрос 2 Тест IQ level 0', question: question_1_2, correct: true)
Answer.create(body: 'Ответ 2 на вопрос 2 Тест IQ level 0', question: question_1_2)

Answer.create(body: 'Ответ 1 на вопрос 1 Тест IQ level 1', question: question_2_1)
Answer.create(body: 'Ответ 2 на вопрос 1 Тест IQ level 1', question: question_2_1)

Answer.create(body: 'Ответ 1 на вопрос 2 Тест IQ level 1', question: question_2_2)
Answer.create(body: 'Ответ 2 на вопрос 2 Тест IQ level 1', question: question_2_2)

# Тест Психология
Answer.create(body: 'Ответ 1 на вопрос 1 Психология level 1', question: question_3_1, correct: true)
Answer.create(body: 'Ответ 2 на вопрос 1 Психология level 1', question: question_3_1)

Answer.create(body: 'Ответ 1 на вопрос 2 Психология level 1', question: question_3_2, correct: true)
Answer.create(body: 'Ответ 2 на вопрос 2 Психология level 1', question: question_3_2)

Answer.create(body: 'Ответ 1 на вопрос 1 Психология level 2', question: question_4_1)
Answer.create(body: 'Ответ 2 на вопрос 1 Психология level 1', question: question_4_1)

Answer.create(body: 'Ответ 1 на вопрос 2 Психология level 2', question: question_4_2)
Answer.create(body: 'Ответ 2 на вопрос 2 Психология level 2', question: question_4_2)

# Тест Психология
Answer.create(body: 'Ответ 1 на вопрос 1 Прозводительность level 0', question: question_5_1, correct: true)
Answer.create(body: 'Ответ 2 на вопрос 1 Прозводительность level 0', question: question_5_1)

Answer.create(body: 'Ответ 1 на вопрос 2 Прозводительность level 0', question: question_5_2, correct: true)
Answer.create(body: 'Ответ 2 на вопрос 2 Прозводительность level 0', question: question_5_2)

Answer.create(body: 'Ответ 1 на вопрос 1 Прозводительность level 2', question: question_6_1)
Answer.create(body: 'Ответ 2 на вопрос 1 Прозводительность level 2', question: question_6_1)

Answer.create(body: 'Ответ 1 на вопрос 2 Прозводительность level 2', question: question_6_2)
Answer.create(body: 'Ответ 2 на вопрос 2 Прозводительность level 2', question: question_6_2)
