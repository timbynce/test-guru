Category.destroy_all
User.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
Result.destroy_all

Category.create([
  { title: 'Frontend' }, { title: 'Backend' }, 
  { title: 'Mobile Dev' }, { title: 'Machine Learning' }
])

User.create([{ title: 'Bill Gates' }, { title: 'Paul Allen' }, { title: 'Steve Ballmer' }])

Test.create([
  { title: 'HTML', category_id: 1, level: 1, author_id: 1 },{ title: 'Go', category_id: 3, level: 3, author_id: 1 },
  { title: 'Ruby', category_id: 3, level: 3, author_id: 2 } ,{ title: 'Java', category_id: 2, level: 4, author_id: 3 },
  { title: 'JS', category_id: 1, level: 3, author_id: 3 }
])

Question.create([
  { body: 'How to create empty hash in Ruby?', test_id: 3 }, 
  { body: 'What are the benefits of using GO compared to other languages?', test_id: 2 },
  { body: 'How to install Rubocop?', test_id: 3 }, 
  { body: 'How to start server of rails project?', test_id: 3 }
])

Answer.create([
  { body: "Just type = {}", question_id: 1, correct: true }, { body: "Just type = []", question_id: 1 },
  { body: 'Gem install rubocop', question_id: 3, correct: true }, { body: 'pip install rubocop', question_id: 3 }
])

Result.create(
  [{ passed: false, test_id: 3, user_id: 3 }, { passed: true, test_id: 2, user_id: 3 },
   { passed: false, test_id: 4, user_id: 3}  
 ])
 