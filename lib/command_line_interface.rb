def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_from_user(name)
  if name == "people"
    name = "character"
  end
  puts "Please, enter a VALID #{name} name!"
  # use gets to capture the user's input. This method should return that input, downcased.
    #input = gets.chomp.split.map(&:capitalize)*' '
    input = gets.chomp
    while input.empty?
      puts "Input is not valid. Try again!"
      input = gets.chomp
    end
    return input
end


# def get_character_from_user()
#   puts "Please, enter a Valid character name!"
#   # use gets to capture the user's input. This method should return that input, downcased.
#     input = gets.chomp.split.map(&:capitalize)*' '
#     while input.empty?
#       puts "Input is not valid. Try again!"
#       input = gets.chomp
#     end
#     return input
# end


def options()
  array = ["people","planets", "species", "vehicles", "starships"]
  puts "************************"
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

# def error_handling
#   while get_character_from_user ==
#     get_character_from_user
#   end
# end
