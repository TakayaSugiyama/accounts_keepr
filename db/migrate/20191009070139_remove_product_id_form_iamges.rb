# frozen_string_literal: true

class RemoveProductIdFormIamges < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :review, index: true, null: false
  end
end
