class CreateBilik < ActiveRecord::Migration
	def change
    create_table :biliks do |t|
      t.string :description
      t.integer :price
      t.string :address
      t.string :city
      t.string :state
      t.integer :user_id
      t.timestamps null: false
    end
	end
end
