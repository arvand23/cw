class ChangeSessionTokenTypeInBookings < ActiveRecord::Migration
  def change
  	change_column :bookings, :session_token, :text
  end
end
