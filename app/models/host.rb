class Host < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
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

  def self.new_wtih_session(params, session)
    if session["devise.host_attributes"]
      new(session["devise.host_attributes"], without_protection: true) do |host|
        host.attributes = params
        host.valid?
      end
    else
      super
    end
  end

  def password_required
    super && provider.blank?
  end
end
