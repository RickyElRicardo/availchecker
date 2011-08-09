desc "This task is called by the Heroku cron add-on"
task :cron => :environment do

  if Time.now.hour == 18 # run at 8pm
    Domain.check_domains
  end
end