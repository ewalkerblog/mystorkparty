class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.string :type
      t.integer :quantity
      t.string :brand
      t.string :color
      t.integer :registry_id

      t.timestamps
    end
	
	add_index :presents, :registry_id
  end
end
