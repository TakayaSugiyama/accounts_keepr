class AddTagsToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :tags, :text
  end
end
