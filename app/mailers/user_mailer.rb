class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def registration_confirmation(user)

    mail(:to => user.email, :subject => "thanks for registering")
  end

  def reminder(user)
    
    mail(:to => user.email, :subject => "reminder")
  end
end