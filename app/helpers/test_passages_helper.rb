# frozen_string_literal: true

module TestPassagesHelper
  def result_title(test_passage)
    t('.correct', correct_questions: test_passage.correct_questions, questions_count: test_passage.questions_count)
  end

  def result_color(test_passage)
    test_passage.good_result? ? 'green' : 'red'
  end

  def result_text(test_passage)
    if test_passage.good_result?
      t('.passed', result_percent: test_passage.result_percent)
    else
      t('.unpassed', result_percent: test_passage.result_percent)
    end
  end

  def view_current_question(test_passage)
    t('.current_question', question_num: test_passage.current_question_number, questions_count: test_passage.questions_count)#"Question #{test_passage.current_question_number}/#{test_passage.questions_count}"
  end
end
