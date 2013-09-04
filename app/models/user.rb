require 'devise'
#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

        devise :database_authenticatable, :trackable, :omniauthable, :rememberable

        attr_accessible :email, :password, :name, :provider, :uid, :access_token, :image

        def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
                user = User.where(:provider => auth.provider, :email => auth.info.email).first
                unless user
                        user = User.create({
                                :name => auth.extra.raw_info.name,
                                :provider => auth.provider,
                                :uid => auth.uid,
                                :email => auth.info.email,
                                :access_token => auth.credentials.token,
                                :password => Devise.friendly_token[0, 20],
                                :image => auth.info.image,
                        })
                end
                user
        end

        def self.new_with_session(params, session)
                super.tap do |user|
                        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                                user.email = data["email"] if user.email.blank?
                        end
                end
        end
end
