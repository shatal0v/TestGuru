# frozen_string_literal: true

categories = Category.create([{ title: :embedded }, { title: :backend }])

users = User.create(
  [{ first_name: 'Richard', last_name: 'Cory', email: 'first@mail.com' },
   { first_name: 'Stephen', last_name: 'Jones', email: 'second@mail.com' }]
)

tests = Test.create(
  [{ title: 'C/C++', level: 3, category_id: categories[0].id, author_id: users[0].id },
   { title: 'Golang', level: 2, category_id: categories[1].id, author_id: users[1].id },
   { title: 'Ruby', level: 1, category_id: categories[1].id, author_id: users[1].id },
   { title: 'Python', level: 2, category_id: categories[1].id, author_id: users[1].id },
   { title: 'STM32', level: 3, category_id: categories[0].id, author_id: users[0].id },
   { title: 'STM32', level: 2, category_id: categories[0].id, author_id: users[0].id }]
)

questions = Question.create(
  [{ body: 'C/C++ question #1', test_id: tests[0].id },
   { body: 'Golang question #1', test_id: tests[1].id },
   { body: 'Ruby question #1', test_id: tests[2].id },
   { body: 'Python question #1', test_id: tests[3].id },
   { body: 'STM32 question #1', test_id: tests[4].id }]
)

answers = Answer.create(
  [{ body: 'Answer 1q1', question_id: questions[0].id, correct: false },
   { body: 'Answer 2q1', question_id: questions[0].id, correct: true },
   { body: 'Answer 1q2', question_id: questions[1].id, correct: false },
   { body: 'Answer 2q2', question_id: questions[1].id, correct: true },
   { body: 'Answer 1q3', question_id: questions[2].id, correct: false },
   { body: 'Answer 2q3', question_id: questions[2].id, correct: true },
   { body: 'Answer 1q4', question_id: questions[3].id, correct: false },
   { body: 'Answer 2q4', question_id: questions[3].id, correct: true },
   { body: 'Answer 1q5', question_id: questions[4].id, correct: false },
   { body: 'Answer 2q5', question_id: questions[4].id, correct: true }]
)
