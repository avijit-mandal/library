class AddProfileImageToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :profile_image, :string
  end
end
