# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb` #done

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

#RESPONSE:
#rails generate model Studio
#rails generate model Movie
#rails generate model Actor
#rails generate model Role

#pls see HW2>app>db>migrate under each file for for studios, movies, actors, roles


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#STUDIO

studio = Studio.new
# puts studio.inspect
studio["name"] = "Warner Bros."
# puts studio.inspect
studio.save

puts "There are #{Studio.all.count} studios"

#MOVIE

#puts "studios: #{Studio.all.count}"
#puts "movies: #{Movie.all.count}"

wb = Studio.find_by({"name" => "Warner Bros."})
#puts wb.inspect

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = "2005"
movie["rated"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = "2008"
movie["rated"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = "2012"
movie["rated"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save

puts "There are #{Movie.all.count} movies"



#ACTOR

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save

puts "There are #{Actor.all.count} actors"

#ROLE

#setup
bb = Movie.find_by({"title" => "Batman Begins"})
tdk = Movie.find_by({"title" => "The Dark Knight"})
tdkr = Movie.find_by({"title" => "The Dark Knight Rises"})

bale = Actor.find_by({"name" => "Christian Bale"})
caine = Actor.find_by({"name" => "Michael Caine"})
neeson = Actor.find_by({"name" => "Liam Neeson"})
holmes = Actor.find_by({"name" => "Katie Holmes"})
oldman = Actor.find_by({"name" => "Gary Oldman"})
ledger = Actor.find_by({"name" => "Heath Ledger"})
eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
hardy = Actor.find_by({"name" => "Tom Hardy"})
gordonlevitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
hathaway = Actor.find_by({"name" => "Anne Hathaway"})


#batmanbegins
role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save


#the dark knight
role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = ledger["id"]
role["character_name"] = "Joker"
role.save

role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = eckhart["id"]
role["character_name"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save


#the dark knight rises
role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = hardy["id"]
role["character_name"] = "Bane"
role.save

role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = gordonlevitt["id"]
role["character_name"] = "John Blake"
role.save

role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = hathaway["id"]
role["character_name"] = "Selina Kyle"
role.save

puts "There are #{Role.all.count} roles"

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

all_movies = Movie.all
#puts all_movies.inspect

for movie in all_movies
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]
    studio_id = Studio.find_by({"id" => movie["studio_id"]})
    name = studio_id["name"]
    puts "#{title} #{year_released} #{rated} #{name}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

all_roles = Role.all
all_actors = Actor.all

for role in all_roles
    movie_id = Movie.find_by({"id" => role["movie_id"]})
    title = movie_id["title"]
    actor_id = Actor.find_by({"id" => role["actor_id"]})
    name = actor_id["name"]
    character_name = role["character_name"]
    puts "#{title} #{name} #{character_name}"
end
    





