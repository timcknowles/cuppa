class OrderPdf < Prawn::Document
  def initialize(registration)
    super(:page_layout => :landscape, :page_size => "A4")
    @registration = registration
    size = 750
    bounding_box([0, cursor], :width => size, :height => size) do
    	image "#{Rails.root}/app/assets/images/STaR_logo.jpg" , :fit => [size, size]
    	stroke_bounds
    	end 
    text "This is certify that"
    text "#{@registration.user.name + " " + registration.user.last_name }"
    text "attended the"
    text "#{@registration.course.title}"
    text "On the"
    text "#{@registration.course.start_time.strftime("%B #{@registration.course.start_time.day.ordinalize} %Y")}"
  end
end

