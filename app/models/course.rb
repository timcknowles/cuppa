class Course < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations


  def places_remaining
    places_available - users.size

  end
end