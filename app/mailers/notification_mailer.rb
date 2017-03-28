class NotificationMailer < ApplicationMailer
  default from: "info@postbox.tut", to: "example@email.com"

  def notification_mailer(notification)
    @notification = notification
    @url  = "http://postbox.tut/"
    mail(:subject => "New Notification")
  end
end
