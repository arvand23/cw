class AddCompleteCodeToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :complete_code, :string
  end
end
