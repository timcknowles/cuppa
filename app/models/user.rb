class User < ActiveRecord::Base

  attr_accessible :name, :last_name, :trust, :hospital, :email, :mobile, :password, :password_confirmation, :admin
  attr_accessible :admin, :as => :admin

  has_many :registrations
  has_many :courses, through: :registrations
  has_many :locations
  has_secure_password
  
  validates :name, presence: true
  validates :password, presence: true, on: :create





end
    


