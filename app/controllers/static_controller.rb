class StaticController < ApplicationController
  def home
    @pending_experts = User.pending_expert
    @experts = User.expert
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
