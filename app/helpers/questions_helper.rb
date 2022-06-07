# frozen_string_literal: true

module QuestionsHelper
  def question_header(object, _name)
    object.new_record? ? "Create new #{@test.title} question" : "Edit #{@question.test.title} question"
  end
end
