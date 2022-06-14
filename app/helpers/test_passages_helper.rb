# frozen_string_literal: true

module TestPassagesHelper
  def result_title(test_passage)
    "Correct: #{test_passage.correct_questions} from #{test_passage.questions_count}"
  end

  def result_color(test_passage)
    test_passage.good_result? ? 'green' : 'red'
  end

  def result_text(test_passage)
    if test_passage.good_result?
      "You passed test! (#{test_passage.result_percent}%)"
    else
      "You didn't pass test! (#{test_passage.result_percent}%)"
    end
  end

  def view_current_question(test_passage)
    "Question #{test_passage.current_question_number}/#{test_passage.questions_count}"
  end
end
