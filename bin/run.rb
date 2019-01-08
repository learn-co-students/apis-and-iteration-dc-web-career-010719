#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome()
api = options()
print_options(api)
if api != "film"
  character = get_from_user(api)
  while show_character_movies(character, api) == false
    #binding.pry
    character = get_from_user(api)
  end
else
  puts "You requested something not from the list!"
end
