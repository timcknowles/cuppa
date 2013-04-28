class UserMailer < ActionMailer::Base
  default from: "tim@harefieldstarcentre.org"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "thanks for registering")
    attachments["STaR_logo.gif"] = File.read("#{Rails.root}/app/assets/images/STaR_logo.gif")
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