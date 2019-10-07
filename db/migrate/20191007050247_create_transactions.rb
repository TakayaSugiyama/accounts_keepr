class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :store_name
      t.references :user, foreign_key: true
      t.integer :purchase_price
      t.date :purchase_date

      t.timestamps
    end
  end
end
