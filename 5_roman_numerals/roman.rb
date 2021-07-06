# frozen_string_literal: true

require_relative 'roman_builder'
require_relative 'roman_parser'

# The Roman numeral is a numerical notation based on the ancient Roman numerical system.
# Used symbols are I, V, X, L, C, D, and M, standing respectively for 1, 5, 10, 50, 100, 500, and 1,000
# in the Hindu-Arabic numeral system. The Roman numeral object holds an internal numerical value and it can't
# represent number 0.
class Roman
  include RomanBuilder
  include RomanParser
  include Comparable

  # Roman.new(value)                     -> new_roman
  #
  # Returns a new roman numeral object that holds passed value as internal value.
  # Passed value has to be either Integer or String.
  #
  # Throws "ArgumentError" Exception if passed value is not Integer nor String.
  # Throws "ArgumentError" Exception if passed value is out of bounds (1-1000).
  # Throws "ArgumentError" Exception if passed string is not a roman numeral.
  def initialize(value)
    unless value.is_a?(Integer) || value.is_a?(String)
      raise ArgumentError, "Expected String or Integer got #{value.class}"
    end

    value = parse(value) if value.is_a?(String)
    raise ArgumentError, "Passed value is out of bounds #{LOWER_BOUND}-#{UPPER_BOUND}" unless check_bounds(value)

    @value = value
  end

  def coerce(other)
    [self, other]
  end

  def +(other)
    @value + other.to_i
  end

  def *(other)
    @value * other.to_i
  end

  def /(other)
    @value / other.to_i
  end

  def -(other)
    @value - other.to_i
  end

  def to_i
    @value
  end

  def to_int
    @value
  end

  def to_s
    build(@value)
  end

  def <=>(other)
    @value <=> other.to_i
  end

  private

  UPPER_BOUND = 1000
  LOWER_BOUND = 1

  # check_bounds(val) -> true or false
  #
  # Returns true if the passed value is in the defined bounds otherwise false.
  def check_bounds(val)
    !(val > UPPER_BOUND || val < LOWER_BOUND)
  end

end
