require 'net/http'
require 'open-uri'
require 'json'

class GetBreweries
    attr_accessor   :name,   :street,     :city,   :state,  :phone,  :website_url
    URL = "https://raw.githubusercontent.com/openbrewerydb/openbrewerydb/master/breweries.json"
    
    def get_breweries
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        breweries = JSON.parse(response.body)
        breweries
    end

    def list_by_state(user_input)
        get_breweries.select do |brewery|
            brewery["state"] == user_input
        end
    end

    def list_by_city(user_input)
        get_breweries.select do |brewery|
            brewery["city"] == user_input
        end
    end

    def spelling?(user_input)
        get_breweries.any? do |brewery|
            brewery["state"] == user_input || brewery["city"] == user_input
        end
    end

    def select(user_input)
        loop do
        choice = gets.strip
        if choice == "y" || choice == "Y"
            self.select_by(user_input)
        elsif choice == "menu" || choice == "Menu"
            Guide.new.guide
        elsif choice =="n" || choice == "N"
            puts ""
            puts "Cheers!"
            exit
        else
            "Please enter a valid selection"
        end
    end
    end

    def selection_prompt
        puts "Would you like to make a new selection?(y/n)"
        puts "You can also return to main menu by entering 'menu'"
        puts ""
    end

    def display_brewery(selection)
        get_breweries.detect do |brewery|
            if brewery["name"] == selection
                puts ""
                puts "#{brewery["name"]}"
                puts "Type:    #{brewery["brewery_type"]}"
                puts "Phone:   #{brewery["phone"]}"
                puts "Address: #{brewery["street"]} #{brewery["city"]}, #{brewery["state"]} #{brewery["postal_code"]}"
                puts ""
            end
        end
        selection_prompt
    end

    def result_message
        puts ""  
        puts "+------------------------------------------------+"        
        puts "|   If you would like to view a breweries        |"
        puts "|    information please enter its number.        |"
        puts "+------------------------------------------------+"
    end

    def invalid
        puts "I'm sorry please enter a valid selection."
    end


end
