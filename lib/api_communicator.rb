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
     if key["name"].upcase == character_name.upcase
       return key["films"]
     end
   end

       return false

end

def print_movies(films)
  puts "-------------------------"
  i = 0
  films.each do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string)

    puts "#{i+1}. #{response_hash["title"]} directed by #{response_hash["director"]}"
    puts "          Released on #{response_hash["release_date"]}\n\n"
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
