require 'uri'

def welcome
  puts "welcome to star wars!\n-----\n"
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
  puts "\nEnter Star Wars character or movie ([exit] to exit)"
  puts "-----\n"

  return gets.chomp.downcase
end
