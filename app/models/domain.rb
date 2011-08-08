class Domain < ActiveRecord::Base
	validates_presence_of :domain
	validates_presence_of :email

	validates :email, :email => true
end
