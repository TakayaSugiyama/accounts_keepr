class RemoveUserIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :user, index: true
  end
end
