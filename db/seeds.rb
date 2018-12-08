categories = Category.create([
  {title: 'art'},
  {title: 'literature'}])

tests = Test.create([
  {title: 'School test', level: 1, category_id: categories[0].id},
  {title: 'Opening', level: 2, category_id: categories[1].id},
  {title: 'For kids', category_id: categories[0].id}])

questions = Question.create([
  {body: 'abcde?', test_id: tests[0].id},
  {body: 'qwerty?', test_id: tests[1].id},
  {body: 'zxcvb?', test_id: tests[2].id}])

answers = Answer.create([
  {body: 'Lkjhg', correct: true, question_id: questions[0].id},
  {body: 'Poiuy', correct: true, question_id: questions[1].id},
  {body: 'Trewq', correct: true, question_id: questions[2].id},
  {body: 'Gfdsa', question_id: questions[0].id},
  {body: 'Hjkl', question_id: questions[1].id},
  {body: 'Nmnvc', question_id: questions[2].id}])

users = User.create([{name: 'David'}, {name: 'Bill'}])
