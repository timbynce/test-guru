# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t(".new_question", test_name: question.test.title)
    else
      t(".edit_test", test_name: question.test.title)
    end
  end
end
