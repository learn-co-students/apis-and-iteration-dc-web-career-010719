#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"


welcome()

while true
  api = options()
  if api == "exit"
    puts "GOOD BYE!!!"
    break
  end
  print_options(api)
  if api != "film"
    character = get_from_user(api)
    if character == "exit"
        puts "GOOD BYE!!!"
        break
    end
    while show_character_movies(character, api) == false
        character = get_from_user(api)
    end
  else
    puts "You requested something not from the list!"
  end
end
