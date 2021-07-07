class AddColumnsToSocks < ActiveRecord::Migration[6.0]
  def change
    add_column :socks, :latitude, :float
    add_column :socks, :longitude, :float
    add_column :socks, :address, :string
  end
end
