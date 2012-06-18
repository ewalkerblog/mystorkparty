class AddNameToRegistries < ActiveRecord::Migration
  def change
    add_column :registries, :name, :string
  end
  
  def self.down
    remove_column :registries, :name, :string
	add_index :registries, :name
	
end
end

