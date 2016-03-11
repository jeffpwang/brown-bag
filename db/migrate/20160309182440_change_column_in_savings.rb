class ChangeColumnInSavings < ActiveRecord::Migration
  def change
    change_column :savings, :amount, :decimal, precision: 5, scale: 2
  end
end
