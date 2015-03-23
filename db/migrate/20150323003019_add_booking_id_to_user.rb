class AddBookingIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :booking_id, :integer
  end
end
