class Accomodation < ApplicationRecord
  belongs_to :host
  has_many :accomodation_photos

  validates :status, inclusion: { in: ["occupied", "unbooked"] }
end
