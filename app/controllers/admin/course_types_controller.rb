class Admin::CourseTypesController < AdminController
  # GET /course_types
  # GET /course_types.json
  def index
    @course_types = CourseType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_types }
      format.csv {render text: @courses.to_csv}
    end
  end

  # GET /course_types/1
  # GET /course_types/1.json
  def show
    @course_type = CourseType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_type }
    
    end
  end

  # GET /course_types/1/edit
  def edit
    @course_type = CourseType.find(params[:id])
  end

  # PUT /course_types/1
  # PUT /course_types/1.json
  def update
    @course_type = CourseType.find(params[:id])

    respond_to do |format|
      if @course_type.update_attributes(params[:course_type])
        format.html { redirect_to @course_type, notice: 'CourseType was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_type.errors, status: :unprocessable_entity }
      end
    end
  end
end

