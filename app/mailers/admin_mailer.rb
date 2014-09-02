class AdminMailer < ActionMailer::Base
  default from: "fansarmailer@gmail.com"

=begin
  def confirmation_email(user)
  	@user = user
  	mail(:to => @user.email, :subject => "Подтверждение регистрации")
  end

  def password_reset_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Сброс пароля")
  end

  def new_password_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Ваш новый пароль")
  end
=end

  def invitation_email(user)
    @user = user
    mail(to: @user.email, subject: "Примите приглашение")
  end
  

end