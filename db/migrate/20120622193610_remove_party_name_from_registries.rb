class RemovePartyNameFromRegistries < ActiveRecord::Migration
  def up
    remove_column :registries, :party_name
      end

  def down
    add_column :registries, :party_name, :string
  end
end
