require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetBreweries
    attr_accessor   :name,   :street,     :city,   :state,  :phone,  :website_url
    URL = "https://raw.githubusercontent.com/openbrewerydb/openbrewerydb/master/breweries.json"
    
    def get_breweries
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        breweries = JSON.parse(response.body)
        breweries
    end

    def select_by_state(user_input)
        get_breweries.select do |brewery|
            brewery["state"] == user_input
        end
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
    end

    def names_by_state(user_input)
        state_hash = {}
        select_by_state(user_input).each_with_index do |brewery, index|
            state_hash[index] = brewery["name"] #hash consists of numbers with assigned brewery names.
            puts "#{index}. #{brewery["name"]}"
        end  
        puts ""  
        puts "+------------------------------------------------+"        
        puts "|If you would like a breweries information       |"
        puts "|please enter its number.                        |"
        puts "+------------------------------------------------+"

        desired_brewery = gets.to_i #input is the number assigned to brewery name, converted to integer
        selection =state_hash[desired_brewery]
        display_brewery(selection)
    end
end
#example = GetBreweries.new.names_by_state("California")
#puts example
