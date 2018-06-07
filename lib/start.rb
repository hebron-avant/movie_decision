require "movie_decision/person"

class MovieRunner
  attr_reader :available_movies

  def initialize
    @available_movies = [
    {name: "The Godfather", rating: :r, rotten_tomatoes: 0.98, length: 175},
    {name: "Dumb and Dumber", rating: :pg_13, rotten_tomatoes: 0.67, length: 107},
    {name: "Anchorman - The Legend of Ron Burgundy", rating: :pg_13, rotten_tomatoes: 0.66, length: 94},
    {name: "The Incredibles", rating: :pg, rotten_tomatoes: 0.97, length: 115},
    {name: "Little Giants", rating: :pg, rotten_tomatoes: 0.40, length: 105},
    {name: "Ghostbusters (1984)", rating: :pg, rotten_tomatoes: 0.97, length: 105},
    {name: "The Matrix", rating: :r, rotten_tomatoes: 0.87, length: 136},
    {name: "Love Actually", rating: :r, rotten_tomatoes: 0.63, length: 135},
    {name: "Beauty and the Beast (1991)", rating: :pg, rotten_tomatoes: 0.94, length: 85},
    {name: "Harry Potter and the Sorcerer's Stone", rating: :pg, rotten_tomatoes: 0.80, length: 152},
    {name: "The Lord of the Rings: The Two Towers", rating: :pg_13, rotten_tomatoes: 0.95, length: 180},
    {name: "The Dark Knight", rating: :pg_13, rotten_tomatoes: 0.94, length: 152},
    {name: "Ace Ventura: Pet Detective", rating: :pg_13, rotten_tomatoes: 0.46, length: 86},
    {name: "Lock, Stock and Two Smoking Barrels", rating: :r, rotten_tomatoes: 0.77, length: 105},
    {name: "Die Hard", rating: :r, rotten_tomatoes: 0.93, length: 114},
    {name: "Raiders of the Lost Ark", rating: :pg, rotten_tomatoes: 0.94, length: 115},
    {name: "Léon: The Professional", rating: :r, rotten_tomatoes: 0.71 , length: 104},
    {name: "Gladiator", rating: :r, rotten_tomatoes: 0.77, length: 155},
    {name: "Some fake movie", rating: :r, rotten_tomatoes: 0.8, length: 85}
  ]
  end

  def find_suitable_movies
    person = create_person
    movies = []

    available_movies.each do |movie|
      movies << MovieDecision::DecisionMaker.build_decision!({person: person, movie: movie})
    end

    movies.reject { |m| m[:result][:declined] }
  end

  def create_person
    name = get_name
    age  = get_age
    with_adult = get_with_adult
    Person.new(name, age, with_adult)
  end

  def get_name
    print "What's your name? "
    gets.chomp
  end

  def get_age
    print "How old are you? "
    gets.chomp.to_i
  end

  def get_with_adult
    print "Do you have an adult with you? (Y/n)"
    gets.chomp == 'Y'
  end

  def start
    suitable_movies = find_suitable_movies

    suitable_movies.each do |m|
      p "You can watch: #{m[:stats][:movie_name]}"
    end
  end
end