#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def run
  input = choose_menu

  if input == 'c'
    puts "\n"
    character = get_character_from_user
    show_character_movies(character)
  elsif input == 'm' || input == 'f'
    puts "\n"
    movie = get_movie_from_user
    show_movie_info(movie)
  elsif input == 'a'
  end

  return input
end

welcome
input = nil
while input != 'e'
  input = run
end