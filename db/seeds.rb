Result.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

category_frontend = Category.create!(title: "Frontend")
category_backend = Category.create!(title: "Backend")

user_for_tests = User.create!(title: 'Steve Ballmer')
author_for_tests = User.create!(title: 'Paul Allen')

test_ruby = Test.create!(title: 'Ruby', category_id: category_frontend.id, level: 3, author_id: author_for_tests.id)
test_js = Test.create!(title: 'JS', category_id: category_frontend.id, level: 3, author_id: author_for_tests.id)

question_ruby_hash = Question.create!(body: 'How to create empty hash in Ruby?', test_id: test_ruby.id)
question_ruby_rubocop = Question.create!(body: 'How to install Rubocop?', test_id: test_ruby.id)

answer_ruby_hash_correct = Answer.create!(body: "Just type = {}", question_id: question_ruby_hash.id , correct: true)
answer_ruby_hash_wrong = Answer.create!(body: "Just type = []", question_id: question_ruby_hash.id)

result_ruby = Result.create!(passed: false, test_id: test_ruby.id , user_id: user_for_tests.id)
result_js = Result.create!(passed: false, test_id: test_js.id , user_id: user_for_tests.id)
