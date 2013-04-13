class FeedbackFormsController < ApplicationController

  before_filter :get_registration

  def show
    unless @feedback_form = @registration.feedback_form
      redirect_to new_registration_feedback_form_path(@registration) 
      return
    end
  end

  def new
  end

  def create
    @feedback_form = @registration.build_feedback_form
    params[:questions].each do |question_id, answer|
      @feedback_form.answers.build(feedback_question_id: question_id, answer: answer)
    end
    @feedback_form.save!
    redirect_to [@registration, @feedback_form]
  end

  protected
    def get_registration
      @registration = current_user.registrations.find(params[:registration_id])
    end

end
