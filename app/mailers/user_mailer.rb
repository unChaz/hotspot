class UserMailer < ActionMailer::Base
  default from: 'noreply@hotspot.com'
 
  def approve_email(user)
    @user = user
    mail(to: @user.email, subject: 'HotSpot Request Approved')
  end
  def deny_email(user)
    @user = user
    mail(to: @user.email, subject: 'HotSpot Request Denied')
  end
  
end