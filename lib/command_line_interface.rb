def welcome
  # puts out a welcome message here!
  puts "*********************************************"
  puts "** Welcome to the Star wars search engine! **"
  puts "** This will tell you what people, planets **"
  puts "**, species, vehicles and starships are in **"
  puts "** certain films                           **"
  puts "**                                         **"
  puts "** Type exit to leave the program!!        **"
  puts "*********************************************\n\n\n\n"

end

def get_from_user(name)
  if name == "people"
    name = "character"
  end
  puts "Please, enter a VALID #{name} name!"

    input = gets.chomp
    while input.empty?
        puts "Input is not valid. Try again!"
        input = gets.chomp
    end
    return input
end



def options()
  array = ["people","planets", "species", "vehicles", "starships", "exit"]
  puts "\n\n\n\n************************"
  puts "people"
  puts "planets"
  puts "species"
  puts "vehicles"
  puts "starships"
  puts "************************\n"
  puts "What would you like to search for: "
  input = gets.chomp
  while !array.include?(input)
    puts "Did not enter a correct option!!"
    input = gets.chomp
  end
  return input
end
