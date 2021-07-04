# frozen_string_literal: true

require_relative 'my_struct'

my = MyStruct.new

my['a'] = 1
my['b'] = 2

puts my[:a]
puts my['a']

my.each_pair { |x, y| puts "#{x} - #{y}" }

p my.methods

my.a = 4
puts my.a

my[:a] = 5
puts my.a

p my.methods
my.a = 20
puts my.a

p my.methods
my.delete_field('a')
p my.methods
# puts zxc.a # exception undefined method

other = MyStruct.new

puts my == other
puts my.eql?(other)

other[:b] = 2

puts my == other
puts my.eql?(other)
