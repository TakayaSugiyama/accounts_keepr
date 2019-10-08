class AddNullFalseToTables < ActiveRecord::Migration[5.2]
  def up 
    change_column_null :memos,:content,false , "aaaaaaaaa"
    change_column_null :memos,:record_id, false, 1
    change_column_null :images, :product_id, false, 1
    change_column_null :products, :record_id, false, 1
    change_column_null :records, :store_name, false, "AAAAAA"
    change_column_null :records,:user_id, false, 1 
    change_column_null :records,:purchase_price,false, 1000
    change_column_null :records,:purchase_date, false,"2019-10-01"
  end

  def down 
    change_column_null :memos, :content,true, nil
    change_column_null :memos, :record_id ,true, nil
    change_column_null :images, :product_id, true, nil
    change_column_null :products, :record_id, true, nil 
    change_column_null :records, :store_name, true, nil
    change_column_null :records,:user_id, false, true,nil
    change_column_null :records,:purchase_price, true,nil
    change_column_null :records,:purchase_date,true,nil
  end
end
