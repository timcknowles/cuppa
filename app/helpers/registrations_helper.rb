module RegistrationsHelper
  def register_btn_text(course)
    course.places_remaining > 0 ? "Register" : "Add me to the waiting list"
  end
end
