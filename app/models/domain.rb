class Domain < ActiveRecord::Base
	validates_presence_of :domain
	validates_presence_of :email

	validates :email, :email => true

	validates_format_of :domain, :with => /^[^\-](?![^\.]+-\.)[a-z0-9\-]+\.[a-z0-9]+/i, :message => "Invalid Domain. Domain names only include A-Z, 0-9, and - (dash). Please do not include the 'www.', 'http://' or anything infrom of the domain. Example: 'domain.com', 'website.net', 'url.org' "



	def check_domains
		Domain.where(:confirmed => "yes").each do |f|
		r = Whois.whois(f.domain)
			if r.available? == true
			EmailNotify.notify_email(f).deliver
			end
		end
	end	
end
