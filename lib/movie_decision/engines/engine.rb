require 'pry'
module MovieDecision
  class Engine
    attr_reader :stats

    def initialize(stats)
      @stats = stats
    end

    def result
      {
        declined:        decline_reasons.any?,
        decline_reasons: decline_reasons,
      }
    end

    private

    def rating_hash
      {
        r: 3,
        pg_13: 2,
        pg: 1
      }
    end

    def decline_reasons
      reasons = []

      reasons << :rating          if too_young?
      reasons << :movie_length    if movie_too_long?
      reasons << :rotten_tomatoes if movie_rating_too_low?
      # binding.pry
      reasons
    end

    def too_young?
      rating_hash[stats[:actual_movie_rating]] > rating_hash[stats[:max_rating]]
    end

    def movie_too_long?
      stats[:actual_movie_length] > stats[:max_movie_length]
    end

    def movie_rating_too_low?
      stats[:actual_rotten_tomatoes_rating] < stats[:min_rotten_tomatoes_rating]
    end
  end
end