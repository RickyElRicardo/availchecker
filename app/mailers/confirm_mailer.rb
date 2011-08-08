class ConfirmMailer < ActionMailer::Base
  default :from => "rickmasta@gmail.com"

  def confirm_email(user)
  	@user = user
  	mail(:to => user.email, :subject => "Please confirm your email.")
  end

end
