require 'rest-client'
require 'json'
require 'pry'

def get_from_api(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def search_character(character_name)
  # make the web request, return results (array of hashes)
  character = character_name.split(" ").join("+")
  response_hash = get_from_api("http://www.swapi.co/api/people/?search=#{character}")
end

def check_character(character_name)
  count = search_character(character_name)["count"]
  if count == 0
    puts "Sorry, we don't have that character in our database."
  elsif count == 1
    return search_character(character_name)["results"][0]["name"]
  else
    names = search_character(character_name)["results"].map { |character| character["name"] }
    puts "Please re-run your search with one of these names:"
    puts names
  end
end

def get_character_movies_from_api(character_name)
  # iterate over the response hash to find the collection of `films` for the given char
  character = search_character(character_name)["results"].find { |character|
    character["name"] == character_name
  }

  films = character["films"]
  film_array = films.map do |film|
    get_from_api(film)
  end
  return film_array

  # return value of this method is an array of hashes w/info about each film
end



def print_movies(films)
  # puts movies in formatted list
  films.map.with_index do |film, index|
    puts "#{index+1}. #{film["title"]}"
  end
end



def show_character_movies(character)
  character_name = check_character(character)
  if character_name == nil
    return
  end
  
  films = get_character_movies_from_api(character_name)
  puts "Here are the films that #{character_name} appeared in:"
  print_movies(films)
end



## BONUS
