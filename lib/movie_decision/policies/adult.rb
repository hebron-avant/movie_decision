module MovieDecision
  module Policies
    class Adult
      def self.max_rating
        :r
      end

      def self.min_rotten_tomatoes_rating
        0.60 # 10%
      end

      def self.max_movie_length
        180 # minutes
      end
    end
  end
end