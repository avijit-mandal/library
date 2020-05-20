class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
    	t.string  :name
      t.references :imageable, polymorphic: true
      t.timestamps null: false
    end
  end
end
