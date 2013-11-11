class UserMailer < ActionMailer::Base
  default from: "noreply@harefieldstarcentre.org"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "thanks for registering")
    
  end

  def reminder(user)
    @user = user
    mail(:to => user.email, :subject => "reminder")
  end

  def feedback(user)
    @user = user
    mail(:to => user.email, :subject => "Please complete feedback")
  end
end