class Domain < ActiveRecord::Base
	validates_presence_of :domain
	validates_presence_of :email

	validates :email, :email => true

	validates_format_of :url, :with => /^[^\-](?![^\.]+-\.)[a-z0-9\-]+\.[a-z0-9]+/i
	end

	def check_domains
		Domain.where(:confirmed => "yes").each do |f|
		r = Whois.whois(f.domain)
			if r.available? == true
			EmailNotify.notify_email(f).deliver
			end
		end
	end	
end
