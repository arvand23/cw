class AddPermalinkToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :permalink, :string
  end
end
