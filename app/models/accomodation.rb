class Accomodation < ActiveRecord::Base
  belongs_to :host
  has_many :accomodation_photos
  paginates_per 2

  validates :status, inclusion: { in: ["occupied", "unbooked"] }

  def self.with_hosts
    includes(:host).order("name")
  end
end
