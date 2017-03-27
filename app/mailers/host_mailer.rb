class HostMailer < ApplicationMailer

  def added_accomodation_email(host)
    #binding.pry
    @host = host
    @url  = "http://localhost:3000/hosts/6/accomodations"
    # binding.pry
    mail(to: host.email, subject: "You've added new accomodations")
  end
end
