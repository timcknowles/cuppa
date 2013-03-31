require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Full correctly" do
    course = Course.new(places_available: 2)
    assert !course.full?
  end
end
