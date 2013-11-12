class OrderPdf < Prawn::Document
  def initialize(registration)
    super(:page_layout => :landscape, :page_size => "A4")
    @registration = registration
    size = 750
    bounding_box([10, 525], :width => size, :height => 525) do
    	move_down 10
        image "#{Rails.root}"+"/public/"+"#{@registration.course.logo_url.to_s}" , :position => 350
        move_down 20
        image  "#{Rails.root}"+"/public/"+"#{@registration.course.certificate_url.to_s}", :fit => [size, size]
        
        image "#{Rails.root}"+"/public/"+"#{@registration.course.signature_url.to_s}",  :position => 325
        stroke_color "012d5a"
        line_width 2
        stroke_bounds 

    	end 
    float do
        bounding_box([20, 400], :width => size, :height => size) do
        font("Courier") do
            move_down 5
            
            text "#{@registration.course.title}" , :size => 30, :align => :center, :style => :bold

            move_down 40
            text "This is certify that" , :align => :center
            move_down 10
            text "#{@registration.user.name + " " + registration.user.last_name }" , :size => 20, :align => :center, :style => :bold
            move_down 10
            text "attended the" , :align => :center
            move_down 20
            text "On the" , :align => :center
            move_down 40
            text "#{@registration.course.start_time.strftime("%B #{@registration.course.start_time.day.ordinalize} %Y")}" , :size => 20, :align => :center , :style => :bold
            end
        end
    end

    float do
            bounding_box([240, 50], :width => 300, :height => 50) do
            text "Dr Martin Carby \n Consultant Respiratory and Transplant Physician", :align => :center 
            end
    end

    end
end

