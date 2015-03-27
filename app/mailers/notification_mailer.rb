class NotificationMailer < ActionMailer::Base
  default from: "aalviri@gmail.com"

  def confirmed(booking)
  	@booking = booking
  	mail(to: @booking.user.email, subject: 'An expert accepted your Cakewalk!')
  end

  def confirmedforexpert(booking, current_user)
  	@booking = booking
  	@current_user = current_user
  	mail(to: @current_user.email, subject: 'You will host this Cakewalk!')
  end
end
