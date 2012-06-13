class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.date :due_date
      t.string :theme
      t.string :gender
	  t.string :other_notes
      t.integer :user_id
      t.integer :present_id

      t.timestamps
    end
	
	add_index :registries, :user_id
	add_index :registries, :present_id
  end
end
