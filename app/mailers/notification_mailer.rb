class NotificationMailer < ActionMailer::Base
  default from: "aalviri@gmail.com"

  def confirmed(booking)
  	@booking = booking
  	mail(to: @booking.user.email, subject: 'An expert accepted your Cakewalk!')
  end
end
