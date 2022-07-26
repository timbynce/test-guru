# frozen_string_literal: true

TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile Dev' },
                                { title: 'Machine Learning' },
                                { title: 'Sports' }
                              ])

users = User.create!([
                       { first_name: 'Steve', last_name: 'Ballmer', email: 'stevebalmer@microsoft.com', password: '12345a' },
                       { first_name: 'Paul', last_name:  'Allen', email: 'paul@microsoft.com', password: '12345a' },
                       { first_name: 'Bill', last_name:  ' Gates', email: 'bill@microsoft.com', password: '12345a' }
                     ])
                     
admins = Admin.create!([{ first_name: 'Artem', last_name: 'Bynce', email: 'cherar@example.com', password: '12345a' }])

tests = Test.create!([
                       { title: 'Ruby', category: categories[0], level: 3, author: users[1] },
                       { title: 'JS', category: categories[0], level: 3, author: users[1] },
                       { title: 'Java', category: categories[1], level: 6, author: users[2] },
                       { title: 'Basketball', category: categories[4], level: 1, author: users[0] }
                     ])

questions = Question.create!([
                               { body: 'How to create empty hash in Ruby?', test: tests[0] },
                               { body: 'How to install Rubocop?', test: tests[0] },
                               { body: 'How many teams are there in the NBA?', test: tests[3] },
                               { body: 'How many games are threr in an NBA season?', test: tests[3] }
                             ])

answers = Answer.create!([
                           { body: 'Just type = {}', question: questions[0], correct: true },
                           { body: 'Just type = []', question: questions[0] },
                           { body: 'Just type = CREATE_EMPTY_HASH', question: questions[0] },
                           { body: 'Just type = HASH_ME!', question: questions[0] },
                           { body: 'gem install rubocop', question: questions[1], correct: true },
                           { body: 'pip install rubocop', question: questions[1] },
                           { body: 'sudo ustanovka rubocopa', question: questions[1] },
                           { body: 'install_rubocop', question: questions[1] },
                           { body: '30', question: questions[2], correct: true },
                           { body: '32', question: questions[2] },
                           { body: '16', question: questions[2] },
                           { body: '7', question: questions[2] },
                           { body: '82', question: questions[3], correct: true },
                           { body: '50', question: questions[3] },
                           { body: '61', question: questions[3] },
                           { body: '80', question: questions[3] }
                         ])

results = TestPassage.create!([
                                { user: users[0], test: tests[0], current_question: questions[0], correct_questions: 1 },
                                { user: users[1], test: tests[0], current_question: questions[1], correct_questions: 0 },
                                { user: users[2], test: tests[3], current_question: questions[3], correct_questions: 1 }
                              ])


badges = Badge.create!([
                         { title: "Badge by category", image: "https://cdn-icons-png.flaticon.com/128/179/179249.png", rule_type: "category", rule_attribute_value: "5" },
                         { title: "Badge by level", image: "https://cdn-icons-png.flaticon.com/128/3787/3787181.png", rule_type: "level", rule_attribute_value: "1"  },
                         { title: "Badge by attempts", image: "https://cdn-icons-png.flaticon.com/128/1910/1910476.png", rule_type: "attempts", rule_attribute_value: "2" }
                        ])
                         
