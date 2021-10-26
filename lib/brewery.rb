class Brewery

    @@breweries = []

  attr_accessor :name,  :type,  :phone, :street,  :city,  :state, :postal_code, :website

  def initialize(brewery)
    @name = brewery["name"]
    @type = brewery["brewery_type"]
    @phone = brewery["phone"]
    @street = brewery["street"]
    @city = brewery["city"]
    @state = brewery["state"]
    @postal_code = brewery["postal_code"]
    @website = brewery["website_url"]
    save
  end

  def self.all
    @@breweries
  end

  def save
    @@breweries << self
  end

  def self.list_by_city(user_input)
    all.select do |brewery|
      brewery.city == user_input
    end
  end

  def self.list_by_state(user_input)
    all.select do |brewery|
      brewery.state == user_input
    end
  end

  def self.display_brewery(selection)
    self.all.detect do |brewery|
      if brewery.name == selection
        puts ""
        puts "#{brewery.name}"
        puts "Type:    #{brewery.type}"
        puts "Phone:   #{brewery.phone}"
        puts "Address: #{brewery.street} #{brewery.city}, #{brewery.state} #{brewery.postal_code}"
        puts "Website: #{brewery.website}"
        puts ""
      end
    end
    CLI.selection_prompt
  end
end

