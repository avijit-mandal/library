class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
    	t.string  :name
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps null: false
    end
    add_index :images, :imageable_id
  end
end
