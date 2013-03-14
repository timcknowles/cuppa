class Course < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :price, :start_time, :title, :venue
end
