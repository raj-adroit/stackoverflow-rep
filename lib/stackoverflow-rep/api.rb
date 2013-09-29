module Adroit
	class Reputation
		def find userid
			begin
				@so_url = "http://stackoverflow.com/users/#{userid}"
				@so_page = Nokogiri::HTML(open(@so_url))
				@reputation = 0
				@so_page.css('div.reputation span a').each do |rep|
					@reputation = rep.content.to_i
				end
				@reputation
			rescue
				p 'stackoverflow-rep : Error -> Invalid USER ID'
				return
			end
		end
	end
end