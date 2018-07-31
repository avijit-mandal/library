class CreateMadicine < ActiveRecord::Migration[5.1]
  def change
    create_table :madicines do |t|
      t.string :sl_no
      t.string :manufacturer
      t.string :name
      t.string :m_type
      t.string :unit
      t.string :price
      t.timestamp
    end
  end
end
