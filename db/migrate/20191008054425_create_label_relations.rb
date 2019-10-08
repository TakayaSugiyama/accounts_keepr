class CreateLabelRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :label_relations do |t|
      t.references :label, foreign_key: true, null: false
      t.references :record, foreign_key: true,null: false

      t.timestamps
    end
  end
end
