
class State < GetBreweries
    def select_by_state(user_input)
        small_hash = {}
        list_by_state(user_input).each_with_index do |brewery, index|
            small_hash[index + 1] = brewery["name"]
            puts "#{index + 1}. #{brewery["name"]}"
        end  
        result_message
        desired_brewery = gets.to_i
        if small_hash.key?(desired_brewery)
            display_brewery(small_hash[desired_brewery])
        else
            invalid
            select_by_state(user_input)
        end

    end
end
