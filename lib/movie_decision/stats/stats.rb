module MovieDecision
  class Stats
    attr_reader :movie_application, :stats, :person, :policy, :movie

    def initialize(movie_application)
      @movie_application = movie_application
      @person = movie_application[:person]
      @policy = @person.policy
      @movie  = movie_application[:movie]
      @stats  = generate!
    end

    def generate!
      {
        age:                        person.age,
        movie_name:                 movie[:name],

        max_rating:                 policy.max_rating,
        actual_movie_rating:        movie[:rating],

        min_rotten_tomatoes_rating: policy.min_rotten_tomatoes_rating,
        actual_rotten_tomatoes_rating: movie[:rotten_tomatoes],

        max_movie_length:           policy.max_movie_length,
        actual_movie_length:        movie[:length],
      }
    end
  end
end