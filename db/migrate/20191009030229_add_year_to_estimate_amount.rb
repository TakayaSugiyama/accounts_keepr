class AddYearToEstimateAmount < ActiveRecord::Migration[5.2]
  def change
    add_column :estimate_amounts, :year, :integer, null: false
  end
end
