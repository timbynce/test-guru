class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.boolean :passed, null: false, :default => false
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
