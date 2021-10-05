class Breweries
    
    @@all = []

    def initialize(attributes)
        attributes.each do |key, value|
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        @@all << self
    end

        


end
