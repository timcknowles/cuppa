class OrderPdf < Prawn::Document
  def initialize(registration)
    super(:page_layout => :landscape, :page_size => "A4")
    @registration = registration
    size = 750
    bounding_box([10, 525], :width => size, :height => 525) do
    	move_down 10
        image "#{Rails.root}/app/assets/images/rbht_logo_new.png" , :position => 350
        move_down 40
        image "#{Rails.root}/app/assets/images/STaR_logo_30%.jpg" , :fit => [size, size]
        image "#{Rails.root}/app/assets/images/signature.png",  :position => 325

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
            text "#{@registration.user.name + " " + registration.user.last_name }" , :align => :center
            move_down 10
            text "attended the" , :align => :center
            move_down 20
            text "On the" , :align => :center
            text "#{@registration.course.start_time.strftime("%B #{@registration.course.start_time.day.ordinalize} %Y")}" , :align => :center
            end
        end
    end

    float do
            bounding_box([240, 50], :width => 300, :height => 50) do
            text "Dr Martin Carby", :align => :center, :style => :bold
            text "Consultant Respiratory and Transplant" , :align => :center
            text "Physician" , :align => :center
            end
    end

    end
end

