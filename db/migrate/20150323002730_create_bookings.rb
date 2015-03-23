class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :skill
      t.integer :user_id
      t.boolean :pending_expert
      t.datetime :time_request1
      t.datetime :time_request2
      t.datetime :time_request3
      t.datetime :time_accepted

      t.timestamps
    end
  end
end
