class BookingsController < ApplicationController
	def create
		@requestedtimes = Booking.new(booking_params)

		if @requestedtimes.save
			redirect_to root_path, :notice => "You will receive an email when we match you with an expert!"
		else
			render static_home_path
		end
	end


	def apply
		@user = current_user
		@user.pending_expert = true
		@user.save
		redirect_to static_home_path, :notice => "Someone will email you for an interview about becoming an expert."
	end

	def makeexpert
		@user = User.find(params[:id])
		@user.expert = true
		@user.save
		redirect_to static_home_path, :notice => "You made #{@user.email} an expert."
	end

	def revokeexpert
		@user = User.find(params[:id])
		@user.expert = false
		@user.save
		redirect_to static_home_path, :notice => "You took away expert priviledges from #{@user.email}."
	end

	private
		def booking_params
			params.require(:booking).permit(:time_request1, :time_request2, :time_request3, :user_id)
		end
end
