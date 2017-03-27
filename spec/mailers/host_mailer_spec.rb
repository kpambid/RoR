require 'rails_helper'

RSpec.describe HostMailer do
  it 'wew' do
    host = Host.create(
    email: "haha@yahoo.com",
    password: "haha",
    first_name: "haha",
    last_name: "hoho",
    location: "location",
    image_url: "image_url"

    )
     host_mailer = HostMailer.added_accomodation_email(host).deliver_now
  end

end
