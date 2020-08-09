class ChangeAdressesToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_table :adresses, :addresses
  end
end
