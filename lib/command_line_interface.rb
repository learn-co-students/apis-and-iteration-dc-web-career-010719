def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars universe.\n\n"
end

def get_character_from_user
  puts "Please enter a character name\n\n"
  # use gets to capture the user's input. This method should return that input, downcased.
  character_name = gets.chomp
end
