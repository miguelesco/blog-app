class AddCommentsRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :author_id, null: false, foreign_key: true
  end
end
