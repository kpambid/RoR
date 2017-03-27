class AccomodationPhoto < ActiveRecord::Base
  belongs_to :accomodation
  #validates :image_url, presence: true
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment :photo, :presence => true,
  :content_type => { :content_type => "image/jpeg" },
  :size => { :in => 0..100.kilobytes }
end
