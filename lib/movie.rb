def help
  puts "What would you like to do?"
  puts "- Type 'add'to add a movie."
  puts "- Type 'update' to update a movie rating"
  puts "- Type 'display' to display all movies"
  puts "- Type 'delete' to delete a movie"
  puts "- Type 'exit' to exit this program"
end

movies = {
        "The Godfather Part 2": 4,
        "What We Do in the Shadows": 4,
        "The Master": 0,
        "Hot Fuzz": 4,
        "Teen Witch": 2,
        }


def display_list(movies)
  movies.each { |movie, rating| puts "#{movie}: #{rating}" }
end

def add_movie(movies)
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Enter a rating (Type a number 0-4)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie's already on the list! FYI you gave it a rating of #{rating}."
  end
end


def update_rating(movies)
  puts "Please enter the title of the movie you want to update:"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the *new* rating? (Type a number 0-4)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with a new rating of #{rating}"
  end
end

def delete_movie(movies)
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  elsif movies[title.to_sym]
    movies.delete(title.to_sym)
    puts "#{title} has been removed from the list"
  else
    puts "Sorry, I didn't understand that"
    help
  end
end

def exit_list
  puts "Goodbye!"
  exit
end

def run_list(movies)
  help
  input = ''
  while input
    puts "Please enter a command"
    input = gets.chomp
    case input
    when 'add' then add_movie(movies)
    when 'update' then update_rating(movies)
    when 'display' then display_list(movies)
    when 'delete' then delete_movie(movies)
    when 'exit' then exit_list
      break
    else help
    end
  end
  run_list(movies)
end
