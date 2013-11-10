class Admin::CoursesController < AdminController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.where("start_time > ?", DateTime.now)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
      format.csv {render text: Course.batch_to_csv(@courses)}
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
      format.csv {render text: @course.to_csv}
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
    @course.course_type = CourseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    new_course_type = @course.course_type
    if @course.save
      if new_course_type 
        redirect_to admin_course_type_feedback_questions_path(@course.course_type), notice: 'Course was successfully created.'
      else
        redirect_to [:admin, @course], notice: 'Course was successfully created.'
      end
    else
      render action: "new"
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to [:admin, @course], notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to admin_courses_path }
      format.json { head :no_content }
    end
  end
end
