class CLI

  def self.welcome_msg
    2.times do puts ""
    end
    puts "|------------------------------------------------|"
    puts "| Hello, welcome to Corbans brewery guide!       |"
    puts "|                                                |"
    puts "| Please enter your selection to view breweries. |"
    puts "|                                                |"
    puts "| 1. View by State.                              |"             
    puts "| 2. View by City.                               |"
    puts "| 3. Search by name.                             |"
    puts "|------------------------------------------------|"
    2.times do puts ""
    end
  end

  def self.selection_prompt
    puts "Would you like to make a new selection?(y/n)"
    puts "You can also return to main menu by entering 'q'"
    puts ""
  end

  def self.index_prompt
    puts ""  
    puts "+------------------------------------------------+"        
    puts "|   If you would like to view a breweries        |"
    puts "|    information please enter its number.        |"
    puts "+------------------------------------------------+"
  end

  def self.name_greeting
    puts ""
    puts "|------------------------------------------------|"
    puts "|          Please enter a Brewery name           |"
    puts "|                                                |"
    puts "|        Ex. Local Relic, Menace Brewing.        |"
    puts "|------------------------------------------------|"
    2.times do puts ""
    end
  end

  def self.state_greeting
    puts ""
    puts "|------------------------------------------------|"
    puts "|   Please enter the State you wish to view.     |"
    puts "|     Ex. Washington, New York, New Mexico.      |"
    puts "|                                                |"
    puts "|------------------------------------------------|"
    2.times do puts ""
    end
  end

  def self.city_greeting
    puts ""
    puts "|------------------------------------------------|"
    puts "|    Please enter the City you wish to view.     |"
    puts "|        Ex. Seattle, San Diego, Denver.         |"
    puts "|                                                |"
    puts "|------------------------------------------------|"
    2.times do puts ""
    end
  end

  def self.cheers_msg
    puts ""
    puts"  .$' *.,  $*   "
    puts"  _~._`_$*`_.~ _"
    puts" |[___________]|"
    puts"  | | |   | | |__"
    puts"  | | |   | | |==;;"
    puts"  | |Cheers!| |  ;]"
    puts"  | | |   | | |  ;]"
    puts"  | | |   | | |==;;"
    puts"  | | |   | | |**/"
    puts"  | | |   | | |"
    puts"|[_____________]|"
  end

  def self.invalid_msg
    puts "I'm sorry please enter a valid selection."
  end
end