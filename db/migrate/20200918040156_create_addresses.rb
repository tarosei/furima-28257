class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postcode,  null: false
      t.integer  :prefecture,  null: false
      t.string   :city,    null: false
      t.string   :address_line_1,  null: false
      t.string   :address_line_2
      t.string   :phone,  null: false
      t.references  :trade,  null: false, foreign_key: true 
      t.timestamps
    end
  end
end
