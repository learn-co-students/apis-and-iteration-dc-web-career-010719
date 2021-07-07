require 'rest-client'
require 'json'
require 'pry'

def get_star_wars_api(resource, query=nil)
  api_url = 'http://www.swapi.co/api/'
  url = api_url + resource

  if query
    url += '?search=' + query
  end

  response_string = RestClient.get(url)
  return JSON.parse(response_string)
end

def get_character_from_api(character_name)
  characters = search_characters(character_name)
  if characters
    return characters[0]
  end
end

def get_character_movies_from_api(character_name)
  character = get_character_from_api(character_name)

  if character
    films = character["films"].map do |film_url|
      get_film_from_api(film_url)
    end

    # sort by release date
    return films.sort do |film_a,film_b| 
      film_a["release_date"] <=> film_b["release_date"]
    end
  else
    return nil
  end
end

def get_character_name_from_api(character_name)
  character = get_character_from_api(character_name)
  if character
    return character["name"]
  end
end

def get_film_from_api(api_url)
  response_string = RestClient.get(api_url)
  return JSON.parse(response_string)
end

def get_film_info_from_api(film_name)
  response_hash = get_star_wars_api('films')

  response_hash["results"].find do |result|
    result["title"].downcase == film_name.downcase
  end
end

def search_characters(character_name)
  get_star_wars_api('people', character_name)["results"]
end

def search_character_names(character_name)
  search_characters(character_name).map { |character| character["name"] }
end

def print_character_movies(films)
  films.each do |film| 
    title = film["title"]
    release_year = film["release_date"].split('-')[0]
    director = film["director"]
    puts "#{title} by #{director} (#{release_year})"
  end
end

def print_movie(film)
  title = film["title"]
  episode = film["episode_id"]
  release_year = film["release_date"].split('-')[0]
  director = film["director"]

  puts "Episode: #{episode}"
  puts "Released: #{release_year}"
  puts "Director: #{director}"
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  character_name = get_character_name_from_api(character)
  
  if films
    puts "\n#{character_name} Films:\n-----\n"
    print_character_movies(films)
  else
    puts "\nNot a Valid Star Wars Character!\n"
  end
end

def show_movie_info(film)
  film_info = get_film_info_from_api(film)
  title = film_info["title"]

  puts "\n#{title}:\n-----\n"

  if film_info
    print_movie(film_info)
  else
    puts "\nNo Star Wars Movie Found!\n"
  end
end

def initialize_character_list
  response_hash = get_star_wars_api('people')
  response_hash["results"].map { |result| result["name"] }
end

def initialize_film_list
  response_hash = get_star_wars_api('films')
  response_hash["results"].map { |result| result["title"] }
end