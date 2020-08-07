class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.string :postcode, null: false
      t.integer :state_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
