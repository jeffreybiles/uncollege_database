class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :city,
                  :job, :college

  #acts_as_authentic do |config|
  #  config.crypto_provider = Authlogic::CryptoProviders::MD5
  #  #Add more options here if needed
  #end

  has_many :interests
  accepts_nested_attributes_for :interests, allow_destroy: true
  has_many :activities, through: :interests

  has_many :authentications

  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] unless email
    self.name = omniauth['info']['name'] unless name
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
