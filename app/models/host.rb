class Host < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  paginates_per 2
  has_many :accomodations

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |host|
      host.provider = auth.provider
      host.uid = auth.uid
      host.name = auth.info.name
      host.oauth_token = auth.credentials.token
      host.oauth_expires_at = Time.at(auth.credentials.expires_at)
      host.save!
    end
  end

end
