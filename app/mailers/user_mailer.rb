class UserMailer < ActionMailer::Base
  default :from => "sarbadaj33@gmail.com"
  
  def general_email(emailer)
    @emailer = emailer
    mail(:to => "#{emailer.to}", :subject => "#{emailer.subject}")
  end
end