# frozen_string_literal: true

categories = Category.create([{ title: :embedded }, { title: :backend }])

users = User.create(
  [{ first_name: 'Richard', last_name: 'Cory', email: 'first@mail.com' },
   { first_name: 'Stephen', last_name: 'Jones', email: 'second@mail.com' }]
)

tests = Test.create(
  [{ title: 'C/C++', level: 3, category_id: categories[0].id, user_id: users[0].id, timer: 6 },
   { title: 'Golang', level: 2, category_id: categories[1].id, user_id: users[1].id, timer: 7 },
   { title: 'Ruby', level: 1, category_id: categories[1].id, user_id: users[1].id, timer: 5 },
   { title: 'Python', level: 2, category_id: categories[1].id, user_id: users[1].id, timer: 10 },
   { title: 'STM32', level: 3, category_id: categories[0].id, user_id: users[0].id, timer: 15 }]
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

bages = Bage.create(
  [{ name: 'Start First Test', image_url: 'https://pp.userapi.com/c855028/v855028227/1f317/VZcL6zKwMAg.jpg', rule: 'first_test_bage' },
   { name: 'Backend Master', image_url: 'https://pp.userapi.com/c855028/v855028227/1f2f7/36JVYp6Sju4.jpg', rule: 'backend_bage' },
   { name: '100% Correct', image_url: 'https://pp.userapi.com/c855028/v855028227/1f307/2aIB9_cmXyw.jpg', rule: 'all_right_bage' },
   { name: 'Embedded Master', image_url: 'https://pp.userapi.com/c855028/v855028227/1f30f/HmY5tO1u-uk.jpg', rule: 'embedded_bage' },
   { name: 'Beginner', image_url: 'https://pp.userapi.com/c855028/v855028227/1f2ff/vXCAmJ56kwk.jpg', rule: 'level_1_bage' }]
  )
