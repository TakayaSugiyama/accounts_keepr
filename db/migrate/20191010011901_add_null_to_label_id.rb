# frozen_string_literal: true

class AddNullToLabelId < ActiveRecord::Migration[5.2]
  def up
    change_column_null :records, :label_id, false, 1
  end

  def down
    change_column_null :records, :lalbel_id, true
  end
end
