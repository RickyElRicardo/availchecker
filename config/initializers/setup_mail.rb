ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "gmail.com",  
     :user_name            => "rickmasta", #Your user name
      :password             => "lanita1000", # Your password
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }



   ActionMailer::Base.default_url_options[:host] = "localhost:3000"