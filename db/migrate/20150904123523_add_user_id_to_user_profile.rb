class AddUserIdToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :user_id, :integer
    add_foreign_key :user_profiles, :users
  end
end
