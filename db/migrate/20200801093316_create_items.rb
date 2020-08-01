class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.text :image, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :ship_charge_id, null: false
      t.integer :ship_region_id, null: false
      t.integer :ship_day_id, null: false
      t.timestamps
    end
  end
end