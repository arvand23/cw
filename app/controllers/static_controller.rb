class StaticController < ApplicationController
  def home
    @currentuser_declined_this = Decline.where("user_id = ?", current_user.id).pluck(:booking_id)
    @pending_experts = User.pending_expert
    @experts = User.expert
    @pending_bookings = Booking.pending_booking.where.not(id: @currentuser_declined_this) #where the id is not this function

    @requestedtimes = Booking.new
  end

  def about
  end

  def dashboard
  end

  def experts
  end

  def apply
  end
end
