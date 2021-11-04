class AddPostIdToRefPosts < ActiveRecord::Migration[6.1]
  def change
    if ActiveRecord::Base.connection.column_exists?(:comments, :post_id)
      remove_column :comments, :post_id
    end
    add_reference :comments, :post, null: false, foreign_key: { to_table: :posts }
  end
end
