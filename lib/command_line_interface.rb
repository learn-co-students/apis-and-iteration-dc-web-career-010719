require 'pry'

def welcome
  puts "Welcome to the Star Wars API!"
end

def get_character_from_user
  puts "Please enter a character name:"
  input = gets.chomp.downcase
  if input.empty?
    get_character_from_user
  else
    return input
  end
end
