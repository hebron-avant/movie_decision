require_relative 'policies/child'
require_relative 'policies/teenager'
require_relative 'policies/adult'

class Person
  attr_accessor :name, :age
  attr_reader   :policy

  def initialize(name, age)
    @name = name
    @age  = age
    set_policy!
  end

  private

  def set_policy!
    @policy = policy_from_age(self.age)
  end

  # Returns which movie policy to use
  # for a given age (e.g. :pg_13)
  #
  # More info here:
  # https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States
  #
  # @param [Integer] age
  # @return [Symbol] policy
  def policy_from_age(age)
    # Available ratings:
    # [:pg, :pg_13, :r]
    return adult_policy     if age >= 21
    return teenager_policy  if age >= 13

    child_policy
  end

  def child_policy
    MovieDecision::Policies::Child
  end

  def teenager_policy
    MovieDecision::Policies::Teenager
  end

  def adult_policy
    MovieDecision::Policies::Adult
  end
end