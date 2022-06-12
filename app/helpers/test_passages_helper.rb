module TestPassagesHelper
  def result_color(result_status)
    if result_status == true
      'color:green'
    else
      'color:red'
    end
  end

  def result_text(result_status)
    if result_status == true
      'You passed test'
    else
      'You didnt passed test'
    end
  end
end
