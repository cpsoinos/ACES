class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def review_alert_email(user)
    @user = user
    @url  = 'http://www.chinatown-aces.herokuapp.com'
    mail(to: @user.email, subject: 'Information regarding your business')
  end

end
