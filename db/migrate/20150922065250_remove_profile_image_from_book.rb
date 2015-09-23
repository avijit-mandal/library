class RemoveProfileImageFromBook < ActiveRecord::Migration
  def change
  	remove_column :books, :profile_image, :string
  end
end
