# frozen_string_literal: true

class AddRecordToMemos < ActiveRecord::Migration[5.2]
  def change
    add_reference :memos, :record, index: true
  end
end
