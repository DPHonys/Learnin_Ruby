module RomanBuilder

  def build(value)
    thousand = MMM[value / 1000]
    hundred = CCC[(value % 1000) / 100]
    ten = XXX[(value % 100) / 10]
    one = III[value % 10]

    thousand + hundred + ten + one
  end

  MMM = ['', 'M'].freeze
  CCC = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'].freeze
  XXX = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'].freeze
  III = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'].freeze
end
