# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  provider          :string(255)
#  uid               :string(255)
#  name              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  oauth_token       :string(255)
#  oauth_secret      :string(255)
#  profile_image_url :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_and_belongs_to_many :articles
  has_many :annotations

  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
    user.save!
    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.profile_image_url = auth["info"]["image"]
    end
  end

  def twitter
    if provider == "twitter"
      @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
    end
  end

end
