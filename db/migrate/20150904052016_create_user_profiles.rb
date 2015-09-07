class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_no, limit: 10 
      t.text :address
      t.string :sex
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
