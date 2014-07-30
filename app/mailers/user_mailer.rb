class UserMailer < ActionMailer::Base
  default from: "fansarmailer@gmail.com"

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

end
