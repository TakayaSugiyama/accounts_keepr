class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :product, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
