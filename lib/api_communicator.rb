require 'rest-client'
require 'json'
require 'pry'


def print_options(apis)
  puts "\n\n\n============================"
  puts "YOUR OPTIONS FOR #{apis} ARE:\n\n"
  hash = get_json(apis)
  hash["results"].each do |key|
    puts key["name"]
  end
  puts "============================\n\n\n"

end

def get_json(api)
  url = "http://www.swapi.co/api/"
  url = url+api
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name, api)
#make the web request
response_hash = get_json(api)
  #binding.pry
   response_hash["results"].each do |key|
     if key["name"] == character_name
       return key["films"]
     end
   end

       return false

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end
def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  puts "-------------------------"
  i = 0
  films.each do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string)
    puts "#{i+1}. #{response_hash["title"]} directed by #{response_hash["director"]}"
    i+=1
  end
  puts "-------------------------"
end

def show_character_movies(character,api)
films = get_character_movies_from_api(character,api)
if films == false
 return false
else
  puts "\n\n#{character} Movies:\n\n"
  print_movies(films)
return true
end
end
#x = get_character_movies_from_api("Luke Skywalker")
#print_movies(x)
## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
