
class State < GetBreweries

    @@small_hash = {}



    def display_state(user_input)
      list_by_state(user_input).each_with_index do |brewery, index|
        @@small_hash[index + 1] = brewery["name"]
        puts "#{index + 1}. #{brewery["name"]}"
      end
      result_message
    end

    def select_by(user_input)
      display_state(user_input)
      input = gets
      desired_brewery = input.to_i
        if input.strip == "q" || input.strip == "Q"
            Guide.new.guide
        elsif @@small_hash.key?(desired_brewery)
          display_brewery(@@small_hash[desired_brewery])
        else
          invalid
          sleep 1
          select_by(user_input)
        end
    end

    def greeting
      puts ""
      puts "|------------------------------------------------|"
      puts "|   Please enter the State you wish to view.     |"
      puts "|     Ex. Washington, New York, New Mexico.      |"
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
