desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
puts "Checking domain..."
Domain.check_domains
puts "Done."
end