module CoursesHelper
  def course_places_remaining(course)
    remaining = course.places_remaining 

    if remaining >= 0
      pluralize remaining, 'place'
    else
      "0 places (#{remaining.abs} on waiting list)"
    end
  end
end
