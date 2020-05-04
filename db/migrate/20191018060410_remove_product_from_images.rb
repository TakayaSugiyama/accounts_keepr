# frozen_string_literal: true

class RemoveProductFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :images, :products
    remove_reference :images, :product
  end
end
