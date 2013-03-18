class User < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
  accepts_nested_attributes_for :courses




end

end


  