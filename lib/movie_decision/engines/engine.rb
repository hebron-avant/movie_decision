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

    def decline_reasons
      reasons = []

      reasons << :rating          if too_young?
      reasons << :movie_length    if movie_too_long?
      reasons << :rotten_tomatoes if movie_rating_too_low?

      reasons
    end

    def too_young?
      stats[:max_rating] != stats[:actual_movie_rating]
    end

    def movie_too_long?
      stats[:actual_movie_length] > stats[:max_movie_length]
    end

    def movie_rating_too_low?
      stats[:actual_rotten_tomatoes_rating] < stats[:min_rotten_tomatoes_rating]
    end
  end
end