class AddDefaultForPostsCounterInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :posts_counter, :integer, default: 0
  end
end
