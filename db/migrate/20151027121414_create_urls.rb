require_relative '../../config/environments/init'

class CreateUrls < ActiveRecord::Migration

	def change
		create_table :urls do |t|
			t.string :long_url
			t.string :short_url
			t.timestamp null:false
		end
	end

end