# frozen_string_literal: true

# A module that holds functionality to parse a String (which represents roman numeral) into a Integer.
module RomanParser

  CHAR_TO_NUMBER = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }.freeze

  # RomanParser.char_to_num(val) -> int
  #
  # Returns a value of character in Roman numeral system. Used symbols are I, V, X, L, C, D, and M, standing
  # respectively for 1, 5, 10, 50, 100, 500, and 1,000 in the Hindu-Arabic numeral system.
  #
  # Examples:
  #   RomanParser.char_to_num('C') # => 100
  def self.char_to_num(val)
    CHAR_TO_NUMBER[val.to_sym]
  end

  # RomanParser.validate(str) -> true or false
  #
  # Returns true if passed String is representing a number in Roman numeral system otherwise false.
  #
  # Examples:
  #   RomanParser.validate('X') # => true
  #   RomanParser.validate('NOPE') # => false
  def self.validate(val)
    val.match(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/)
  end

  # RomanParser.parse(str) -> int
  #
  # Returns Integer that has value of passed String (which represents roman numeral).
  #
  # Examples:
  #   RomanParser.parse('LXXVII') # => 77
  #
  # Throws "ArgumentError" Exception if passed string is not a roman numeral.
  def self.parse(val)
    raise ArgumentError, 'Passed value is not a roman numeral' unless validate(val)

    number = 0
    val = val.gsub('IV', 'IIII').gsub('IX', 'VIIII')
    val = val.gsub('XL', 'XXXX').gsub('XC', 'LXXXX')
    val = val.gsub('CD', 'CCCC').gsub('CM', 'DCCCC')
    val.each_char do |i|
      number += char_to_num(i)
    end
    number
  end

end
