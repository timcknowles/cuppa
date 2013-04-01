class Course < ActiveRecord::Base
  attr_accessible :title, :description, :start_time, :end_time, :venue, :price, :places_available
  has_many :registrations
  has_many :users, through: :registrations
  

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :venue, presence: true
  validates :price, presence: true
  validates :places_available, presence: true, numericality: { only_integer: true }
  
  def places_remaining
    places_available - users.size
  end
  
  def full?
    places_remaining <= 0
  end
end