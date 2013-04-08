class User < ActiveRecord::Base

  attr_accessible :name, :last_name, :trust, :hospital, :email, :mobile, :password, :password_confirmation, :admin, :location_id, :location_name
  attr_accessible :admin, :as => :admin

  has_many :registrations
  has_many :courses, through: :registrations
  belongs_to :location
  has_secure_password
  
  validates :name, presence: true
  validates :password, presence: true, on: :create

def location_name
  location.try(:trust)
end

def location_name=(trust)
  self.location = Location.find_or_create_by_name(trust) if trust.present?
end



end
    


