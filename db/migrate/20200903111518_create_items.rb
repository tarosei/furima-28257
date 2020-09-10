class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false, default: ""
      t.text :explain,           null: false
      t.integer  :category_id,      null: false 
      t.integer :status_id,         null: false 
      t.integer :carriage_id,       null: false
      t.integer :area_id,           null: false
      t.integer :lead_time_id,       null: false
      t.integer :price,          null: false
      t.string :user_id,         null: false, default:""
    end
  end
end
