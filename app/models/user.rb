class User < ActiveRecord::Base
	has_many :declines
	has_many :bookings

  def self.expert; where(:expert => TRUE); end #couldn't use this in home view as ...expert? because this just returns a list of experts and you cant use current_user in it.
  def self.applied_as_expert; where(:pending_expert => TRUE); end
  def self.notexpert; where(:expert => FALSE); end
  def self.pending_expert; applied_as_expert.notexpert; end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end