class AddUserIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :user_id, :integer
    add_foreign_key :books, :users
  end
end
