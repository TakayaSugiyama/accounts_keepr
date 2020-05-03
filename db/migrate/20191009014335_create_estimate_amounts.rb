# frozen_string_literal: true

class CreateEstimateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :estimate_amounts do |t|
      t.references :user, foreign_key: true
      t.integer :month
      t.integer :price

      t.timestamps
    end
  end
end
