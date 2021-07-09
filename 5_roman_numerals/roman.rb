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

  # Roman.new(value) -> new_roman
  #
  # Returns a new Roman numeral object that holds passed value as internal value.
  # Passed value has to be either Integer or String.
  #
  # Throws "ArgumentError" Exception if passed value is not Integer nor String.
  # Throws "ArgumentError" Exception if passed value is out of bounds (1-1000).
  def initialize(value)
    unless value.is_a?(Integer) || value.is_a?(String)
      raise ArgumentError, "Expected String or Integer got #{value.class}"
    end

    value = RomanParser.parse(value) if value.is_a?(String)
    raise ArgumentError, "Passed value is out of bounds #{LOWER_BOUND}-#{UPPER_BOUND}" unless check_bounds(value)

    @value = value
  end

  # roman.coerce(other)  ->  array
  #
  # Returns an array with both roman object and other object represented as Integer objects.
  #
  # This is achieved by converting both roman and other objects to Integers.
  def coerce(other)
    [self, other]
  end

  # roman object + other object -> int
  #
  # Other object needs to be responding to 'to_i' method.
  #
  # Performs addition and returns result as Integer.
  def +(other)
    @value + other.to_i
  end

  # roman object * other object -> int
  #
  # Other object needs to be responding to 'to_i' method.
  #
  # Performs multiplication and returns result as Integer.
  def *(other)
    @value * other.to_i
  end

  # roman object / other object -> int
  #
  # Other object needs to be responding to 'to_i' method.
  #
  # Performs division and returns result as Integer.
  def /(other)
    @value / other.to_i
  end

  # roman object - other object -> int
  #
  # Other object needs to be responding to 'to_i' method.
  #
  # Performs subtraction and returns result as Integer.
  def -(other)
    @value - other.to_i
  end

  # roman.to_i    ->  integer
  # roman.to_int  ->  integer
  #
  # Since Roman object holds internal value as Integer it's returned.
  #
  # #to_int is an alias for #to_i.
  def to_i
    @value
  end

  alias to_int to_i

  # roman.to_s -> string
  #
  # Returns a String that represents the value of roman object in roman format.
  def to_s
    RomanBuilder.build(@value)
  end

  # roman object <=> other object -> -1, 0, +1, or nil
  #
  # Other object needs to be responding to 'to_i' method.
  #
  # Comparison: Returns -1, 0, or +1 depending on whether roman object is
  # less than, equal to, or greater than other object.
  #
  # Comparison itself is passed to comparison of Integers.
  def <=>(other)
    @value <=> other.to_i
  end

  private

  UPPER_BOUND = 1000
  LOWER_BOUND = 1

  # check_bounds(int) -> true or false
  #
  # Returns true if the passed Integer is in the defined bounds otherwise false.
  def check_bounds(val)
    !(val > UPPER_BOUND || val < LOWER_BOUND)
  end

end
