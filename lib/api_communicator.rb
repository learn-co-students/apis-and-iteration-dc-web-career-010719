require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  films = []

  response_hash["results"].each do |result|
    if result["name"].downcase == character_name
      films = result["films"].map do |film_url|
        get_film_from_api(film_url)
      end
    end
  end

  return films
end

def get_film_from_api(api_url)
  response_string = RestClient.get(api_url)
  return JSON.parse(response_string)
end

def get_film_info_from_api(film_name)
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].find do |result|
    result["title"].downcase == film_name.downcase
  end
end

def print_movies(films)
  films.each do |film| 
    title = film["title"]
    release_date = film["release_date"]
    director = film["director"]
    puts "#{title} by #{director} (#{release_date})"
  end
end

def print_movie(film)
  title = film["title"]
  release_date = film["release_date"]
  director = film["director"]

  puts "Title: #{title}"
  puts "Release Date: #{release_date}"
  puts "Director: #{director}"
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  
  if films
    puts "\nCharacter Films:\n-----\n"
    print_movies(films)
  else
    puts "\nNot a Valid Star Wars Character!\n"
  end
end

def show_movie_info(film)
  film_info = get_film_info_from_api(film)
  puts "\nMovie Info:\n-----\n"

  if film_info
    print_movie(film_info)
  else
    puts "\nNo Star Wars Movie Found!\n"
  end
end