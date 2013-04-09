user = User.new 
user.name = "Tim Knowles"
user.mobile = ""
user.email = "tim.c.knowles@gmail.com"
user.password = "Foobar"

user.admin = true
user.save!


require 'csv'

Location.delete_all

CSV.foreach("#{Rails.root}/lib/data/trust_data.csv") do |row|
   Location.create!(:trust => row[0], :hospital => row[1])
end