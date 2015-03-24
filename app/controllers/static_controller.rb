class StaticController < ApplicationController
  def home
    @pending_experts = User.pending_expert
    @pending_experts_nil = User.pending_expert_nil #because need to make boolean default => false
    @experts = User.expert

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
