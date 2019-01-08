#!/usr/bin/env ruby
require 'pry'

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
welcome

character = ""
while character.empty?
    character = get_character_from_user
    if get_character_movies_from_api(character) == "not_found"
        character = ""
    elsif get_character_movies_from_api(character) == "exit"
        break
    end
end

if character != "exit"
    puts ""
    show_character_movies(character)
end
