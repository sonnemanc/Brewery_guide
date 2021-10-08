class City < GetBreweries
    @@small_hash = {}



    def display_city(user_input)
        list_by_city(user_input).each_with_index do |brewery, index|
            @@small_hash[index + 1] = brewery["name"]
            puts "#{index + 1}. #{brewery["name"]}"
        end
    
        result_message
    end

    def select_by(user_input)
        display_city(user_input)
        desired_brewery = gets.to_i
            if @@small_hash.key?(desired_brewery)
                display_brewery(@@small_hash[desired_brewery])
            else
                invalid
                select_by(user_input)
        end
    end

    def greeting
        puts ""
        puts "|------------------------------------------------|"
        puts "|    Please enter the City you wish to view.     |"
        puts "|        Ex. Seattle, San Diego, Denver.         |"
        puts "|                                                |"
        puts "|------------------------------------------------|"
        2.times do puts ""
        end
    end

    def search
        greeting
        user_input = gets.strip
        if valid?(user_input)
            select_by(user_input)
            select(user_input)
        else
          invalid
          search
        end
    end

end