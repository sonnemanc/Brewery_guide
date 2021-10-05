require './lib/scraper.rb'

class Breweries
    
    @@all = []

    def initialize
        GetBreweries.new.get_breweries.each do |key, value|
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        @@all << self 
    end

    def self.all
        @@all
    end

end