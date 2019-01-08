require 'uri'
def welcome
  puts "Welcome"
end

def get_character_from_user
  puts "Please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp
  while input.empty?
    puts "Please enter a character."
    input= gets.chomp
  end
  return input
end
