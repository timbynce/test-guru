class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :gists, %i[user_id question_id], unique: true
  end
end
