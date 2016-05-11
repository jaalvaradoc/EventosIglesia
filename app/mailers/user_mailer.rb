class UserMailer < ActionMailer::Base
  default :from => "javisvmusic@gmail.com"

  def forgot_password(user, key)
    @user, @key = user, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => user.email_address )
  end

end
