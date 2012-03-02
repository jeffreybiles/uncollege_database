class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::MD5
    #Add more options here if needed
  end


  has_many :interests
  accepts_nested_attributes_for :interests, allow_destroy: true
  has_many :activities, through: :interests
end
