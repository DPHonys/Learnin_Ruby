# frozen_string_literal: true

require_relative 'speech'

# Robot Class
class Robot
  include Speech
  include Comparable

  attr_reader :name, :arms

  def initialize(name = nil)
    raise ArgumentError unless name.is_a?(String)

    @name = name
    @arms = []
  end

  def add_arms(*arms)
    raise ArgumentError unless arms.all?(Arm)

    @arms += arms
  end

  def speak(text)
    puts text
  end

  def introduce
    puts "Hi, my name is #{@name} and my arms are :"
    arms = @arms.map(&:type) # Array#map - crates new array from values that are returned by block
    arms.tally.each { |a| puts "#{a[0]} > #{a[1]}" } # tally extracts value and how many times it appears (new hash)
  end

  def score
    arm_score = 0
    length_average = 0
    @arms.each do |a|
      arm_score += a.value
      length_average += a.length
    end
    length_average /= @arms.size unless @arms.size.zero?

    arm_score + length_average
  end

  def <=>(other)
    score <=> other.score
  end
end
