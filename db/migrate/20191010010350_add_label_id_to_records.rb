# frozen_string_literal: true

class AddLabelIdToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :label, foreign_key: true
  end
end
