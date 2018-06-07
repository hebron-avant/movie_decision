require "movie_decision/version"
require 'movie_decision/engines/engine'
require 'movie_decision/stats/stats'
require 'movie_decision/person'

module MovieDecision
  class DecisionMaker

    # Builds a decision on whether to 
    # watch a movie or not
    #
    # movie_application is expected to look like:
    # {
    #   person: person_object,
    #   movie: movie_hash,
    # }
    # @param [Hash] movie_application
    def self.build_decision!(movie_application)
      person = movie_application[:person]
      policy = person.policy

      stats  = self.stats.new(movie_application).stats
      engine = self.engine.new(stats)

      result = engine.result

      {stats: stats, result: result}
    end

    def self.engine
      MovieDecision::Engine
    end

    def self.stats
      MovieDecision::Stats
    end
  end
end
