class User < ApplicationRecord
  def results_by_level(level)
    Result.joins("JOIN tests ON results.test_id = tests.id").where("results.user_id = ? AND tests.level = ?", level, id)
  end
end
