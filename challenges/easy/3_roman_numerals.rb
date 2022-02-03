# Problem
# Write a program that converts modern integers to Roman number equivalents

# Examples / Test Cases
# I => 1
# V => 5
# X => 10
# L => 50
# C => 100
# D => 500
# M => 1000

# You'll never have more than three of one symbol next to each other
# III, IV (3, 4)
# VIII, IX (8, 9)
# XXXIX, XL (39, 40)
# XLV 45

# Data Structures
# instance variable to store the number
# validation to make sure it is an integer < 3000

# Algorithm
# 10**0
# 10**1
# 10**2
# 10**3

class RomanNumeral
  def initialize(number)
    @number = number
    validation
  end
  
  # ROMANS = {
  #   1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
  #   6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X',
  #   20 => 'XX', 30 => 'XXX', 40 => 'XL', 50 => 'L', 60 => 'LX',
  #   70 => 'LXX', 80 => 'LXXX', 90 => 'XC', 100 => 'C', 200 => 'CC',
  #   300 => 'CCC', 400 => 'CD', 500 => 'D', 600 => 'DC', 700 => 'DCC',
  #   800 => 'DCCC', 900 => 'CM', 1000 => 'M', 2000 => 'MM', 3000 => 'MMM'
  # }
  
  ROMAN_NUMERALS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }
  
  def validation
    raise ArgumentError unless @number.class == Integer && @number < 4000
  end
  
  # def to_roman
  #   digits = @number.digits.map.with_index do |num, idx|
  #     num * (10**idx)
  #   end
    
  #   romans = digits.map do |num|
  #     ROMANS[num]
  #   end
    
  #   romans.reverse.join
  # end
  
  def to_roman
    current = @number
    roman = ''
    [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].each do |num|
      multiplier, remainder = current.divmod(num)
      roman += (ROMAN_NUMERALS.key(num) * multiplier)
      current = remainder
    end
    roman
  end

end

# My solution uses 30 number/Roman pairs to build the Roman Numeral. The book solution uses 13 pairs and some math to build it a little less manually. But it relies on Hash#each iterating in the proper, descending order.

# Create a new solution using only the 13 pairs, but without relyling on each to iterate in the correct order

ROMAN_NUMERALS = {
  "I" => 1,
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000
}

def to_roman(number)
  current = number
  roman = ''
  [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].each do |num|
    multiplier, remainder = current.divmod(num)
    roman += (ROMAN_NUMERALS.key(num) * multiplier)
    current = remainder
  end
  roman
end
