class CreateBooking < ActiveRecord::Migration
	def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.text :booking_detail
      t.integer :user_id
      t.integer :bilik_id
      t.timestamps
    end
	end
end
