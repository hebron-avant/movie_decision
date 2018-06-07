module MovieDecision
  module Policies
    class Teenager
      def self.max_rating
        :pg_13
      end

      def self.min_rotten_tomatoes_rating
        0.40 # 40%
      end

      def self.max_movie_length
        90 # minutes
      end
    end
  end
end