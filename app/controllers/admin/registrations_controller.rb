class Admin::RegistrationsController < AdminController

  def show
    @registration = Registration.find(params[:id])
  end
  
  def toggle_paid
    @registration = Registration.find(params[:id])
    @registration.toggle_paid!
    respond_to do |format|
      format.html { redirect_to admin_course_url(@registration.course)}
      format.json { head :no_content }
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
  
    respond_to do |format|
      format.html { redirect_to admin_course_url(@registration.course)}
      format.json { head :no_content }
    end
  end
end
