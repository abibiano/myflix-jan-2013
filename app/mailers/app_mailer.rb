class AppMailer < ActionMailer::Base
  default from: "info@bibiano.es"

  def welcome_email(user)
    @user = user
    @url  = "http://myflix.com/login"
    mail(to: user.email, subject: "Welcom to myFlix!")
  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: "Password Reset")
  end

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: invitation.friend_email, subject: "Invitation to myFlix!")
  end
end