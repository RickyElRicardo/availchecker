class EmailNotify < ActionMailer::Base
  default :from => "rickmasta@gmail.com"

  def notify_email(user)
  	@user = user
  	mail(:to => user.email, :subject => @user.domain+" has become available.")
  end

end
