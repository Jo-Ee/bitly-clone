require_relative '../../config/environments/init'
require 'securerandom' #SecureRandom is a module that generates random number and alphabets

class Url < ActiveRecord::Base

	before_create :shorten #Call backs = before_create saves the entry automatically
	validates :long_url, presence: true, :format => {:with => URI.regexp}
	validates :short_url, uniqueness: true

	def shorten
		self.short_url = SecureRandom.urlsafe_base64(12)			
	end


	 def count
	    self.click_count += 1
	    self.save
	 end

end


