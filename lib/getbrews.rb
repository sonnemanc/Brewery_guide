require 'net/http'
require 'open-uri'
require 'json'

require_relative '../lib/brewery.rb'

class GetBreweries

    URL = "https://raw.githubusercontent.com/openbrewerydb/openbrewerydb/master/breweries.json"

    def get_breweries
      uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      breweries = JSON.parse(response.body)
      breweries
    end

    def make_brewery
      get_breweries.each do |brewery|
        Brewery.new(brewery)
      end
    end

end

#message methods to cli

#GetBreweries.new.make_brewery