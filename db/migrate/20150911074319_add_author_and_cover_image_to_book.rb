class AddAuthorAndCoverImageToBook < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :cover_image, :string
  end
end
