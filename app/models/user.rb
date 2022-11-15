class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def login
     @login || self.username || self.email || self.mobile
  end
  
  
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        where(conditions.to_h).where(["lower(username) = :value OR lower(email)= :value OR (mobile)= :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:mobile) || conditions.has_key?(:email) || conditions.has_key?(:username)
        where(conditions.to_h).first
      end
    end
end
