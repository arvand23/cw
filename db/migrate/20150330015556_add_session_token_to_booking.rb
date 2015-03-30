class AddSessionTokenToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :session_token, :string
  end
end
