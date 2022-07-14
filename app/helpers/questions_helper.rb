# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t(".new_question", test_name: question.test.title)
    else
      "Edit #{question.test.title} question"
    end
  end
end
