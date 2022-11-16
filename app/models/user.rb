class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :omniauthable ,omniauth_providers: [:facebook, :google_oauth2, :linkedin], authentication_keys: [:login]

  def login
     @login || self.email || self.mobile
  end
  
  
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        unless login.to_i == 0 
          where(conditions.to_h).where(["lower(email)= :value OR (mobile)= :value", { :value => login.downcase } ]).first
        else
          where(conditions.to_h).where(["lower(email)= :value", { :value => login.downcase } ]).first
        end
      elsif conditions.has_key?(:mobile) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.find_by(email: data['email'])

      unless user
          user = User.create(
            email: data['email'],
            name: data['name'],
            password: Devise.friendly_token[0,20]
          )
      end
      user.provider = access_token.uid
      user.uid = access_token.provider
      user.save
      user
    end
end
