require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  make_web_request
  film_arr = find_films(character_name)
  film_info(film_arr)
end

def make_web_request
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end

def find_films(character_name)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  response_hash = make_web_request
  response_hash["results"].each_with_index do |attr, index|
    if attr.has_value?(character_name)
      return response_hash["results"][index]["films"]
    end
  end
end


def film_info(film_arr)
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  info_arr = film_arr.map do |link|
    film_string = RestClient.get(link)
    film_info = JSON.parse(film_string)
  end
  info_arr
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |movie|
    puts movie["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
