require 'net/http'
require 'open-uri'
require 'json'

class GetBreweries
    attr_accessor   :name,   :street,     :city,   :state,  :phone,  :website_url
    STATE = "https://api.openbrewerydb.org/breweries?by_state="
    
    def by_state(user_input)
        selection = user_input
        uri = URI.parse(STATE + selection)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

    def names_by_state(user_input)
        by_state(user_input).each_with_index do |brewery, index|
            puts "#{index + 1}. #{brewery["name"]}"
        end
    end
end

example = GetBreweries.new.names_by_state("California")
example