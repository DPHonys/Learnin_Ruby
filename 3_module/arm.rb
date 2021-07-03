# frozen_string_literal: true

# Arm class
class Arm
  attr_reader :length, :type

  def initialize(length, type)
    # %i[] = Non-interpolated Array of symbols, separated by whitespace
    raise ArgumentError unless length.positive? || %i[poker slasher grabber].include?(type)

    @length = length
    @type = type
  end

  def value
    case @type
    when :poker then 1
    when :slasher then 3
    else 5
    end
  end
end
