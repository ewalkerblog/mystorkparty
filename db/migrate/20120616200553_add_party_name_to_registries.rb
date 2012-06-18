class AddPartyNameToRegistries < ActiveRecord::Migration
  def change
    add_column :registries, :party_name, :string
	add_index :registries, :party_name
  end
  
  def self.down
    remove_column :registries, :party_name, :string
	add_index :registries, :party_name
	
end
end