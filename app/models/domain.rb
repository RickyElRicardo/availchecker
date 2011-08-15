class Domain < ActiveRecord::Base
	validates_presence_of :domain
	validates_presence_of :email

	validates :email, :email => true

	validates_format_of :domain, :with => /^[^\-](?![^\.]+-\.)[a-z0-9\-]+\.[a-z0-9]+/i, :message => "Invalid Domain. Domain names only include A-Z, 0-9, and - (dash). Please do not include the 'www.', 'http://' or anything infrom of the domain. Example: 'domain.com', 'website.net', 'url.org' "



	def self.check_domains
    @domains = Domain.all
    #@domains.where(:confirmed => "yes").each do |f|
    @domains.each do |f|
      begin
        r = Whois.whois(f.domain)
        if r.available? == true
          EmailNotify.notify_email(f).deliver
        end
      rescue 
        next  #do something here like re raise the error or store the email address in a bad_emails table or do both just simply do nothing at all
      end
    end
  end
end
 