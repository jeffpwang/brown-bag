class ChangeGoalAmountColumnInGoals < ActiveRecord::Migration
  def change
    change_column :goals, :goal_amount, :decimal, precision: 10, scale: 2
    change_column :goals, :saved_amount, :decimal, default: 0.00, precision: 10, scale: 2
  end
end
