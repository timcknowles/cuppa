class User < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
 

  has_secure_password
  validates_presence_of :password, :on => :create


end


