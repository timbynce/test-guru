class AddAttributesNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :title, false)
    change_column_null(:users, :title, false)

    change_column_null(:questions, :body, false)
    change_column_null(:answers, :body, false)

    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
  end
end
