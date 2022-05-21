Result.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

categories = Category.create!([
  { title: "Frontend" },
  { title: "Backend" },
  { title: "Mobile Dev" },
  { title: "Machine Learning" },
  { title: "Sports" }
])

users = User.create!([
  { title: 'Steve Ballmer' },
  { title: 'Paul Allen' },
  { title: 'Bill Gates' }
])

tests = Test.create!([
  { title: 'Ruby', category_id: categories[0].id, level: 3, author_id: users[1].id },
  { title: 'JS', category_id: categories[0].id, level: 3, author_id: users[1].id },
  { title: 'Java', category_id: categories[1].id, level: 4, author_id: users[2].id },
  { title: 'Basketball', category_id: categories[4].id, level: 1, author_id: users[0].id }
])

questions = Question.create!([
{ body: 'How to create empty hash in Ruby?', test_id: tests[0].id },
{ body: 'How to install Rubocop?', test_id: tests[0].id },
{ body: 'How many teams are there in the NBA?', test_id: tests[3].id },
{ body: 'How many games are threr in an NBA season?', test_id: tests[3].id }
])

answers = Answer.create!([
{ body: "Just type = {}", question_id: questions[0].id , correct: true },
{ body: "Just type = []", question_id: questions[0].id },
{ body: "Just type = CREATE_EMPTY_HASH", question_id: questions[0].id },
{ body: "Just type = HASH_ME!", question_id: questions[0].id },
{ body: "gem install rubocop", question_id: questions[1].id , correct: true },
{ body: "pip install rubocop", question_id: questions[1].id },
{ body: "sudo ustanovka rubocopa", question_id: questions[1].id },
{ body: "install_rubocop", question_id: questions[1].id },
{ body: "30", question_id: questions[2].id, correct: true },
{ body: "32", question_id: questions[2].id },
{ body: "16", question_id: questions[2].id },
{ body: "7", question_id: questions[2].id },
{ body: "82", question_id: questions[3].id, correct: true },
{ body: "50", question_id: questions[3].id },
{ body: "61", question_id: questions[3].id },
{ body: "80", question_id: questions[3].id }
])

results = Result.create!([
  { passed: false, test_id: tests[0].id , user_id: users[0].id },
  { passed: false, test_id: tests[1].id , user_id: users[0].id },
  { passed: true, test_id: tests[3].id , user_id: users[1].id }
])
