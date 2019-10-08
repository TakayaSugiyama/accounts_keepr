class RemoveUserIdFromMemos < ActiveRecord::Migration[5.2]
  def change
    remove_reference :memos, :user, index: true
  end
end
