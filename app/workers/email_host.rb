class EmailHost
  @queue = :email_host_queue

  def self.perform(accomodation_id)
    accomodation = Accomodation.find(accomodation_id)
    HostMailer.added_accomodation_email(accomodation).deliver
  end
end
