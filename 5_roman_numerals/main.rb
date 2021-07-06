# frozen_string_literal: true

require_relative 'roman'

puts first = Roman.new(5)
puts second = Roman.new('')

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

# TODO
# 6.roman # => "VI"
# 'IV'.number # => 4

# 6.to_rom # => Roman
# "V".to_rom # => Roman
