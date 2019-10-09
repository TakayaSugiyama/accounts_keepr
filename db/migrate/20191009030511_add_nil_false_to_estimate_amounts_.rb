class AddNilFalseToEstimateAmounts < ActiveRecord::Migration[5.2]
  def up
    change_column_null :estimate_amounts, :user_id, false, 1 
    change_column_null :estimate_amounts, :month, false,1 
    change_column_null :estimate_amounts, :price, false, 0 
  end

  def down 
    change_column_null :estimate_amounts, :user_id, true
    change_column_null :estimate_amounts, :month, true 
    change_column_null :estimate_amounts, :price, true
  end
end
