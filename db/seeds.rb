admin = User.new 
admin.name = "Tim"
admin.last_name = "Knowles"
admin.email = "admin@example.com"
admin.password = "foobar"
admin.admin = true
admin.save!

user = User.new 
user.name = "Jeremy"
user.last_name = "Walker"
user.email = "user@example.com"
user.password = "foobar"
user.admin = false
user.save!

course_type_1 = CourseType.create!(title: "My First Course Type", description: "Foobar to the max")
feedback_question_1 = course_type_1.feedback_questions.create!(content: "My question 1", question_type_id: 1)
feedback_question_2 = course_type_1.feedback_questions.create!(content: "My question 2", question_type_id: 1)
feedback_question_3 = course_type_1.feedback_questions.create!(content: "My question 3", question_type_id: 1)
feedback_question_4 = course_type_1.feedback_questions.create!(content: "My question 4", question_type_id: 1)

course_1 = course_type_1.courses.create!(start_time: DateTime.now - 1.week, end_time: DateTime.now - 1.week, venue: "Somewhere", price: 20.33, places_available: 12)
course_2 = course_type_1.courses.create!(start_time: DateTime.now + 1.week, end_time: DateTime.now + 1.week, venue: "Somewhere 2", price: 20.33, places_available: 12)
course_3 = course_type_1.courses.create!(start_time: DateTime.now + 1.month, end_time: DateTime.now + 1.month, venue: "Somewhere 3", price: 20.33, places_available: 12)
course_4 = course_type_1.courses.create!(start_time: DateTime.now + 2.months, end_time: DateTime.now + 1.months, venue: "Somewhere 4", price: 20.33, places_available: 12)

registration_1 = user.registrations.create!(course: course_1)
registration_2 = user.registrations.create!(course: course_2)
registration_3 = user.registrations.create!(course: course_3)

feedback_form = registration_1.create_feedback_form(completed_at: DateTime.now - 3.days)
answer = feedback_form.answers.build
answer.feedback_question = feedback_question_1
answer.answer = "Foobar 123"
answer.save!

require 'csv'

Location.delete_all

CSV.foreach("#{Rails.root}/lib/data/trust_data.csv") do |row|
   Location.create!(:trust => row[0], :hospital => row[1])
end
