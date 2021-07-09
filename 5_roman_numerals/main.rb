# frozen_string_literal: true

require_relative 'roman'
require_relative 'integer_patch'
require_relative 'string_patch'

puts first = Roman.new(5)
puts second = Roman.new('XXX')

puts first + second
puts first * second
puts first / second
puts first - second

puts first + 1
puts first * 2
puts first / 3
puts first - 4

puts 1 + second
puts 2 * second
puts 3 / second
puts 4 - second

puts [Roman.new(1), Roman.new(3), Roman.new(9)].sum

puts Roman.new(4) == 4 # => true
puts Roman.new(5) > Roman.new(1) # => true

puts [Roman.new(1), Roman.new(3), Roman.new(9)].min

puts (1..100).first(second)

puts first.to_s # => "V"

puts first.to_i
puts second.to_int

using IntegerPatch
using StringPatch

puts 6.roman # => "VI"
puts 'IV'.number # => 4

puts 6.to_rom.class # => Roman
puts 'V'.to_rom.class # => Roman
