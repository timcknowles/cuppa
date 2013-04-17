module RegistrationsHelper
  def register_btn_text(course)
    course.places_remaining > 0 ? "Register" : "Add me to the waiting list"
  end

  def pdf_image_tag(filename, options = {})
  path = Rails.root.join("app/assets/images/#{filename}")
  options[:src] = path.to_s
  attributes = options.map{ |k,v| "#{k}='#{v}'" }.join(" ")
  raw("<img #{attributes}/>")
  end
end

