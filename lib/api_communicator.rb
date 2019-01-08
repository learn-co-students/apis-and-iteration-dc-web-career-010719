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
  # if user inputs a real character, call url_hash on film links
     if !character_info.nil?
       character_info["films"].map {|url|
         url_hash(url)
       }
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

# makes web request for swapi links
def url_hash(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
   films.each_with_index {|film, i|
   puts "#{i+1}. " + film["title"]
  }

end

def show_character_movies(character)
  # calls get_character_movies_from_api method and stores
  # array of character movie data into 'films'
  films = get_character_movies_from_api(character)
  # while 'films' returns nil, prompts user for new input
  while films.nil?
    puts "That's not a character. Try again:"
    character = gets.chomp
   #stores new input into 'films'
    films = get_character_movies_from_api(character)
  end
  # when 'films' does not return films, calls print_movies method
  if !films.nil?
    puts "\nHere is your list of #{character} movies:\n\n"
    print_movies(films)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
