def welcome
  puts "Welcome Star Wars Fan!"
end

def get_character_from_user
  puts "Please enter a character name"
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
