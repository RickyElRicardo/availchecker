desc "This task is called by the Heroku cron add-on"
task :cron => :environment do

  if Time.now.hour == 20 # run at midnight
    Domain.check_domains
  end
end