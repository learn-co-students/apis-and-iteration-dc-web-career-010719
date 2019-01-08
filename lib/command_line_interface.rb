require 'uri'

def welcome
  puts "Welcome to the Star Wars API Search Engine\n"
  puts "(vehicles not yet included)"
end

def get_input_from_user(input_type)
  puts "please enter a #{input_type} name:"
  input = gets.chomp

  while input.empty?
    puts "please enter a #{input_type} name:"
    input = gets.chomp
  end

  return input.downcase
end

def get_character_from_user
  return get_input_from_user('character')
end

def get_movie_from_user
  return get_input_from_user('movie')
end

def get_input
  puts "\n*****"
  puts "Enter Star Wars character or movie ([exit] to exit)"
  puts "-----\n"

  return gets.chomp.downcase
end
