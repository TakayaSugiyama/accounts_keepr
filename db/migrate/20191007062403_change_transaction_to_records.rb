class ChangeTransactionToRecords < ActiveRecord::Migration[5.2]
  def change 
    rename_table :transactions, :records
  end
end
