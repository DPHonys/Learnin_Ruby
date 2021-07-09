# frozen_string_literal: true

require_relative 'roman_parser'
require_relative 'roman'

# A module that refines the String class to add functionality.
#
# Added methods are:
#   str.number -> int
#   str.to_rom -> roman
module StringPatch
  include RomanParser

  refine String do

    # str.number -> int
    #
    # Returns an Integer that is equal to the numerical value of String which represents roman numeral.
    #
    # Example:
    #   "LXXVII".number # => 77
    def number
      RomanParser.parse(self)
    end

    # str.to_rom -> roman
    #
    # Returns a Roman object which has a numerical value of String as internal value.
    #
    # Example:
    #   "LXXVII".to_rom # => Roman
    def to_rom
      Roman.new(self)
    end
  end
end
