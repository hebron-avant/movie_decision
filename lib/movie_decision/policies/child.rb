module MovieDecision
  module Policies
    class Child
      def self.max_rating
        :pg
      end

      def self.min_rotten_tomatoes_rating
        0.10 # 10%
      end

      def self.max_movie_length
        90 # minutes
      end
    end
  end
end