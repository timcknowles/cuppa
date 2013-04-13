class Admin::FeedbackQuestionsController < AdminController

  before_filter :get_course

  def new
    @question = @course.feedback_questions.build
  end

  def create
    @question = @course.feedback_questions.create(params[:feedback_question])
    redirect_to admin_course_path(@course)
  end

  def edit
    @question = @course.feedback_questions.find(params[:id])
  end

  def update
    @question = @course.feedback_questions.find(params[:id])
    @question.update_attributes(params[:feedback_question])
    redirect_to admin_course_path(@course)
  end

  def destroy
    @question = @course.feedback_questions.find(params[:id])
    @question.destroy
    redirect_to admin_course_path(@course)
  end


  protected

    def get_course
      @course = Course.find(params[:course_id])
    end
end
