class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :level
      t.integer :attempts
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
