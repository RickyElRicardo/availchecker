class Domain < ActiveRecord::Base
	validates_presence_of :domain
	validates_presence_of :email

	validates :email, :email => true

	def check_domains
		Domain.each do |f|
		r = Whois.whois(f.domain)
			if r.available? == true
			EmailNotify.notify_email(f).deliver
			end
		end
	end	
end
