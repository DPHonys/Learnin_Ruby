# version 1
def fizz_buzz
  ret = ''

  (1..100).each do |i|
    if i%15 == 0
      ret << 'Fizz Buzz'
    elsif i%3 == 0
      ret << 'Fizz'
    elsif i%5 == 0
      ret << 'Buzz'
    else
      ret << i.to_s
    end

    ret << ', ' unless i.equal? 100
  end

  ret
end

# version 2
def fizz_buzz_two
  print '1, '
  (2..99).each do |i|
    if (i % 15).equal? 0
      print 'Fizz Buzz, '
    elsif (i % 3).equal? 0
      print 'Fizz, '
    elsif (i % 5).equal? 0
      print 'Buzz, '
    else
      print i.to_s, ', '
    end
  end
  print "Buzz\n"
end

# version 3
def fizz_buzz_three
  (1..100).each do |i|
    if (i % 15).zero?
      print 'Fizz Buzz'
    elsif (i % 3).zero? || (i % 5).zero?
      print((i % 3).zero? ? 'Fizz' : '')
      print((i % 5).zero? ? 'Buzz' : '')
    else
      print i.to_s
    end
    print ', ' unless i.equal? 100
  end
end

# version 4 - max 10 LOC, rubocop compliant
def fizz_buzz_four
  ret = ''
  (1..100).each do |i|
    tmp = ''
    tmp << 'Fizz' if (i % 3).zero?
    tmp << ' ' if (i % 15).zero?
    tmp << 'Buzz' if (i % 5).zero?
    tmp << i.to_s if tmp.empty?
    ret << "#{tmp} #{', ' if i < 100}" # string interpolation
  end
  ret
end

# puts fizz_buzz
# fizz_buzz_two
# fizz_buzz_three
puts fizz_buzz_four
