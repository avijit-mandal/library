class RemoveProfileImageFromTables < ActiveRecord::Migration
  def change
  	remove_column :user_profiles, :profile_image, :string
  	remove_column :books, :cover_image, :string
  end
end
