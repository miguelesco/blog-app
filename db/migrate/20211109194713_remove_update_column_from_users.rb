class RemoveUpdateColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :update_at
  end
end
