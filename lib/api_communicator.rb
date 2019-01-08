require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = url_hash('http://www.swapi.co/api/people/')
  #response_hash = JSON.parse(response_string)
  character_info = response_hash["results"].find {|character|
     character["name"] == character_name
     }
     #   get_character_from_user
    character_info["films"].map {|url|
       url_hash(url)
     }
end
# end
# def nil_get
#   "Not a character. Try again."
#   input = gets.chomp
#   get_character_movies_from_api(input)
# end


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def url_hash(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
   films.each_with_index {|film, i|
   puts "#{i+1}. "+film["title"]
  }

end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts "Here is your list of #{character} movies:\n\n"
  print_movies(films)
  
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
