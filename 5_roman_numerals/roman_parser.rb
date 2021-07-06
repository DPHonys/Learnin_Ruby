module RomanParser

  def parse(val)
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

  private

  CHAR_TO_NUMBER = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }.freeze

  def char_to_num(val)
    CHAR_TO_NUMBER[val.to_sym]
  end

  def validate(val)
    val.match(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/)
  end

end
