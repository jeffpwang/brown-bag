class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :goal_amount
      t.integer :saved_amount, default: 0 
      t.integer :goal_progress, default: 0 
      t.boolean :goal_met, default: false
      t.timestamps null: false
    end 
  end
end
