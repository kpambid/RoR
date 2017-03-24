class AccomodationPhoto < ApplicationRecord
  belongs_to :accomodation
  validates :image_url, presence: true
end
