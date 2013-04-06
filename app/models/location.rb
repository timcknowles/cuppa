class Location < ActiveRecord::Base
  attr_accessible :hospital, :trust
  has_many :users
end
