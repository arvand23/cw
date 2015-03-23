class BookingsController < ApplicationController
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
end
