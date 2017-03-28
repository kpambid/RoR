class HostMailer < ApplicationMailer
  default from: "info@postbox.tut", to: "example@email.com"

  def added_accomodation_email(accomodation)
    @accomodation = accomodation
    mail(subject: "You've added new accomodations")
  end
end
