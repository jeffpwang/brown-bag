class CreateSavings < ActiveRecord::Migration
  def change
    create_table :savings do |t|
      t.string :category
      t.integer :amount
      t.integer :goal_id

      t.timestamps null: false
    end
  end
end
