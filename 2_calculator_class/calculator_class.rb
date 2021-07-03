# frozen_string_literal: true

# Calculator class with simple operations
class Calculator
  attr_reader :name, :result

  def initialize(result = 0, name = nil)
    @result = result
    @name = name unless name.nil?
  end

  # Instance methods
  def add(*params)
    params.each do |i|
      @result += i unless i.nil?
    end
    self
  end

  def subtract(param)
    @result -= param unless param.nil?
    self
  end

  def multiply(param)
    @result *= param unless param.nil?
    self
  end

  def divide(param)
    unless param.nil?
      raise ArgumentError if param.zero?

      @result /= param
    end
    self
  end

  def name=(name)
    @name = name.upcase
  end

  # Class methods
  def self.extreme(param, array)
    param.equal?(:max) ? array.max : array.min
  end

  def self.number?(number)
    number.is_a? Numeric
  end
end

# Calculator usage examples
calc = Calculator.new(10)
x = calc.add(1.0, 2, 3).subtract(7).add(11).divide(4).multiply(5).result
puts x

calc.name = 'test'
puts calc.name

puts Calculator.number? 5
puts Calculator.number? 5.2
puts Calculator.number? 'nope'

puts Calculator.extreme(:max, [4, 3, 7, 1])
puts Calculator.extreme(:min, [3, 5, 7, 5])
