class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.integer :transaction_id
      t.timestamps
    end
  end
end
