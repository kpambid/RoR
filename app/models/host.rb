class Host < ActiveRecord::Base
  paginates_per 2
  # has_many :accomodations
end
