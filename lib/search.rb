class Search

  @@search_hash = {}

  def self.valid?(user_input)
    if user_input == "q" || user_input == "Q"
      Guide.new.guide
    elsif user_input.length > 1 && value_included?(user_input)
      true
    else
      false
    end
  end

  def self.value_included?(user_input)
    Brewery.all.each do |i|
      return true if i.state == user_input || i.city == user_input || i.name == user_input
    end
      false
  end

  def self.display_state(user_input)
    Brewery.list_by_state(user_input).each_with_index do |brewery, index|
      @@search_hash[index + 1] = brewery.name
      puts "#{index + 1}. #{brewery.name}"
    end
    CLI.index_prompt
  end

  def self.display_city(user_input)
    Brewery.list_by_city(user_input).each_with_index do |brewery, index|
      @@search_hash[index + 1] = brewery.name
      puts "#{index + 1}. #{brewery.name}"
    end
    CLI.index_prompt
  end

  def self.select_by(user_input)
    input = gets
    desired_brewery = input.to_i
    if input.strip == "q" || input.strip == "Q"
      Guide.new.guide
    elsif @@search_hash.key?(desired_brewery)
      Brewery.display_brewery(@@search_hash[desired_brewery])
    else
      CLI.invalid_msg
      sleep 1
      self.select_by(user_input)
    end
  end

  def self.select(user_input)
    loop do
      choice = gets.strip
      if choice == "y" || choice == "Y"
        self.clear
        Guide.new.guide
      elsif choice == "q" || choice == "Q"
        self.clear
        Guide.new.guide
      elsif choice =="n" || choice == "N"
        CLI.cheers_msg
        exit
      else
        "Please enter a valid selection"
      end
    end
  end

  def self.clear
    @@search_hash.clear
  end
end