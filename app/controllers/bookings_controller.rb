class BookingsController < ApplicationController
	def create
		@requestedtimes = Booking.new(booking_params)

		if @requestedtimes.save
			redirect_to root_path, :notice => "You will receive an email when we match you with an expert!"
		else
			render static_home_path
		end
	end

	#input card
	def finishregistration
		@current_user = current_user
	end

	def inputcard #adds card_id
		    if logged_in?
		      # Create a customer to bill later with stripe
		      customer = Stripe::Customer.create(
		        :email => current_user.email,
		        #:name => current_user.name,
		        :card  => params[:stripeToken]#,
		        #:customer => current_user.card_id
		      )

		      # Save stripe customer id into card_id 
		      if current_user.update_attribute(:card_id, customer.id) # Card ID / Customer ID = Same same
		        redirect_to static_home_path, :notice => "Your registration is complete. Now you can book an expert!"
		      else
		        # Form failed
		        redirect_to finishregistration, :notice => "Something went wrong withs storing your payment info."
		      end
		    else
		      # This should never happen
		      render text: "Stripe Error"
		    end
	end

	def room
		@booking = Booking.accepted.find_by_permalink(params[:id]) 
		@username = @booking.user.name
	end

	def accepttime1
		@booking = Booking.find(params[:id])
		@booking.time_accepted = @booking.time_request1
		@booking.create_permalink
		@booking.save
		redirect_to static_home_path, :notice => "You just accepted to Cakewalk #{@booking.user.name}. Check your email inbox."
		#send email with permalink to room and time_accepted
	end

	def accepttime2
		@booking = Booking.find(params[:id])
		@booking.time_accepted = @booking.time_request2
		@booking.create_permalink
		@booking.save
		redirect_to static_home_path, :notice => "You just accepted to Cakewalk #{@booking.user.name}. Check your email inbox."
	end

	def accepttime3
		@booking = Booking.find(params[:id])
		@booking.time_accepted = @booking.time_request3
		@booking.create_permalink
		@booking.save
		redirect_to static_home_path, :notice => "You just accepted to Cakewalk #{@booking.user.name}. Check your email inbox."
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
