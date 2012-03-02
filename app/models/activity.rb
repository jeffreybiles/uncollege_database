class Activity < ActiveRecord::Base
  has_many :interests, dependent: :destroy
  accepts_nested_attributes_for :interests, allow_destroy: true
  has_many :users, through: :interests
end
