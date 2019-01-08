def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "Please, enter a valid character name!"
  # use gets to capture the user's input. This method should return that input, downcased.
      input = gets.chomp
    while input.empty?
      puts "Input is not valid. Try again!"
      input = gets.chomp
    end
    return input
end
