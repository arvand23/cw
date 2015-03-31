class DeclinesController < ApplicationController

	def declineuser
		@decline = Decline.new
		@current_booking = Booking.find(params[:id])

		@decline.user_id = current_user.id
		@decline.booking_id = @current_booking.id
		@decline.save
		redirect_to :back, :notice => "You declined #{@current_booking.user.email}."
	end
end
