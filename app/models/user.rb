class User < ActiveRecord::Base

  attr_accessible :name, :email, :mobile, :password, :password_confirmation, :admin
  attr_accessor :accessible

  has_many :registrations
  has_many :courses, through: :registrations
 
  has_secure_password
  
  validates :name, presence: true
  validates :password, presence: true, on: :create






    

private 
    def mass_assignment_authorizer
      super + (accessible || [])

    end
  end


