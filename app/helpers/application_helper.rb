=begin
module ApplicationHelper

  def pdf_image_tag(filename, options = {})
  path = Rails.root.join("app/assets/images/#{filename}")
  options[:src] = path.to_s
  attributes = options.map{ |k,v| "#{k}='#{v}'" }.join(" ")
  raw("<img #{attributes}/>")
  end
end 
=end

module ApplicationHelper
  def already_registered?(course)
    if @already_registered === nil
      @already_registered = current_user.registrations.where(course_id: course.id).exists?
    end
    @already_registered
  end
end