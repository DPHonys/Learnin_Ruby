# frozen_string_literal: true

# A module that holds functionality to build a String (which represents roman numeral) from Integer.
module RomanBuilder

  MMM = ['', 'M'].freeze
  CCC = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'].freeze
  XXX = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'].freeze
  III = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'].freeze

  # RomanBuilder.build(int) -> str
  #
  # Returns a String which represents the passed Integer value in roman representation.
  #
  # Examples:
  #   RomanBuilder.build(77) # => 'LXXVII'
  def self.build(value)
    thousand = MMM[value / 1000]
    hundred = CCC[(value % 1000) / 100]
    ten = XXX[(value % 100) / 10]
    one = III[value % 10]

    thousand + hundred + ten + one
  end
end
