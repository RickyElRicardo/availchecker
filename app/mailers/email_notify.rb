class EmailNotify < ActionMailer::Base
  default :from => "rickmasta@gmail.com"

  def notify_email(user)
  	@user = user
  	mail(:to => user.email, :subject => @user.domain+" has become available.")
  end
  
  def check_email(successful_check)
  	mail(:to => "rickmasta@gmail.com", :subject => "Daily domain notify check done.")
  end

end
