class User < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
end
