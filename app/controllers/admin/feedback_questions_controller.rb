class Admin::FeedbackQuestionsController < AdminController

  before_filter :get_course_type

  def new
    @question = @course_type.feedback_questions.build
  end

  def create
    @question = @course_type.feedback_questions.create(params[:feedback_question])
    redirect_to admin_course_type_feedback_questions_path(@course_type)
  end

  def edit
    @question = @course_type.feedback_questions.find(params[:id])
  end

  def update
    @question = @course_type.feedback_questions.find(params[:id])
    @question.update_attributes(params[:feedback_question])
    redirect_to admin_course_type_feedback_questions_path(@course_type)
  end

  def destroy
    @question = @course_type.feedback_questions.find(params[:id])
    @question.destroy
    redirect_to admin_course_type_feedback_questions_path(@course_type)
  end

  protected

    def get_course_type
      @course_type = CourseType.find(params[:course_type_id])
    end
end
