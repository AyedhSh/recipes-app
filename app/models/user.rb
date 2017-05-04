class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable
  has_many :recipes

validates :email, uniqueness: true
  def self.from_omniauth(auth)
   
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.username = auth.info.first_name
        user.password = Devise.friendly_token[0,20]

      end
  end

  def self.new_with_session(params, session)
    if session["devis.user_attributes"]
      new(session["devis.user_attributes"],without_protect: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super   
    end
  end
  
end
