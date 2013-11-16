class UserMailer < ActionMailer::Base
  default from: "noreply@harefieldstarcentre.org"

  def registration_confirmation(registration)
    @registration = registration    
    @user = registration.user
    mail(:to => registration.user.email, :subject => "Harefield STaR Centre: Thanks for registering")
    
  end



  def reminder(registration)
    @registration = registration    
    @user = registration.user
    mail(:to => registration.user.email, :subject => "Harefield STaR Centre: Reminder")
  end

  def feedback(registration)
    @registration = registration    
    @user = registration.user
    mail(:to => registration.user.email, :subject => "Harefield STaR Centre: Please complete feedback")
  end
end