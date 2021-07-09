# frozen_string_literal: true

require_relative 'roman_builder'
require_relative 'roman'

# A module that refines the Integer class to add functionality.
#
# Added methods are:
#   int.roman -> str
#   int.to_rom -> roman
module IntegerPatch

  refine Integer do

    # int.roman -> str
    #
    # Returns a String which is a roman representation of Integer.
    #
    # Example:
    #   77.roman # => 'LXXVII'
    def roman
      RomanBuilder.build(self)
    end

    # int.to_rom -> roman
    #
    # Returns a Roman object which has Integer as internal value.
    #
    # Example:
    #   77.to_rom # => Roman
    def to_rom
      Roman.new(self)
    end
  end
end
