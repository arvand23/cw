class ChangeSessionTypeInBookings < ActiveRecord::Migration
  def change
  	change_column :bookings, :session, :text
  end
end
