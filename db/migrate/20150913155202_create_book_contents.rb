class CreateBookContents < ActiveRecord::Migration[5.1]
  def change
    create_table :book_contents do |t|
    	t.integer :book_id
    	t.integer :user_id
    	t.string :chapter
    	t.text :chapter_content

      t.timestamps null: false
    end
  end
end
