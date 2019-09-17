require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = web_request
  api_urls = list_of_apis(response_hash, character_name)
  movie_list = movie_collection(api_urls)
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
def web_request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end

def list_of_apis(response_hash, character_name)
  api_urls = Array.new
  response_hash["results"].each do |character_info|
    if character_info["name"] == character_name
      api_urls = character_info["films"]
    end
  end
  api_urls
end

def movie_collection(api_urls)
  movie_collection = api_urls.map do |link|
    movie_string = RestClient.get(link)
    movie_info = JSON.parse(movie_string)
  end
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
