class UserMailer < ActionMailer::Base
  default from: "chhingchhing.hem@gmail.com"

  def welcome_email(user_email, email_body)
    mail(to: user_email,
         body: email_body,
         content_type: "text/html",
         subject: "Already rendered!")
  end

end
