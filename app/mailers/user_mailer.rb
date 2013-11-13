class UserMailer < ActionMailer::Base
  default from: "noreply@harefieldstarcentre.org"

  def registration_confirmation(registration)
    @user = registration.user
    #@registration = registration
    mail(:to => user.email, :subject => "Harefield STaR Centre: Thanks for registering")
    
  end

  def reminder(user)
    @user = user
    mail(:to => user.email, :subject => "Harefield STaR Centre: Reminder")
  end

  def feedback(user)
    @user = user
    mail(:to => user.email, :subject => "Harefield STaR Centre: Please complete feedback")
  end
end