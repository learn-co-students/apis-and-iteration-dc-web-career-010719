require 'rest-client'
require 'json'
require 'pry'
def get_character_json
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end
def get_character_movies_from_api(character_name)
response_hash = get_character_json
   response_hash.each do |key|
     if key["name"] == character_name
       return key["films"]
     else return false
     end
   end
end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string)
    puts response_hash["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
if !films
 return false
else
  print_movies(films)
return true
  end
end
