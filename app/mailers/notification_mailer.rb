class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmed(booking)
  	@booking = booking
  	mail(to: @booking.user.email, subject: 'An expert accepted your Cakewalk!')
  end
end
