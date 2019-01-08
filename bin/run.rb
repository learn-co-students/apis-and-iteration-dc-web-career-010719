#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

require 'string-similarity'

$characters = initialize_character_list
$films = initialize_film_list
$all = $characters + $films

def get_match(input)
  # attempts to find best match
  # of character or movie

  # luke -> luke skywalker
  # empire strikes back -> the empire strikes back
  
  match = nil

  match = $all.find do |item|
    item.downcase == input
  end

  if match.nil?
    match = $all.find do |item|
      item.downcase.start_with?(input)
    end
  end

  if match.nil?
    match = $all.find do |item|
      item.downcase.end_with?(input)
    end
  end
  
  if match.nil?
    almost_match = $all.find do |item|
      String::Similarity.levenshtein(item.downcase, input) >= 0.3
    end

    if almost_match
      puts "Did you mean? #{almost_match} [Y/n]"
      choice = gets.chomp
      if choice.empty? || choice =~ /[yY]/
        match = almost_match
      end
    end
  end

  return match
end

def run
  input = get_input
  if input == "exit"
    exit
  end

  input = get_match(input)

  if $characters.include?(input)
    show_character_movies(input)
  elsif $films.include?(input)
    show_movie_info(input)
  else
    puts "Not a valid Star Wars character or movie, ya dunce!"
  end
end

welcome
while true
  run
end
