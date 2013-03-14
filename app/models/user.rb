class User < ActiveRecord::Base
  attr_accessible :email, :mobile, :name
end
