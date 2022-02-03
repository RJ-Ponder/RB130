# Problem
# Write a program to determine if a triangle is equilateral, isosceles, or scalene

# Examples/Test Cases
# See the test suite. Basically, the main method is #kind, which returns a string: 'equilateral', 'isosceles', or 'scalene'
# An ArgumentError is thrown if the length of sides are invalid.
# Invalid cases:
  # s1 or s2 or s3 is <= 0
  # s1 + s2 <= s3
  # s1 + s3 <= s2
  # s2 + s3 <= s1

# Data structures
  # Triangle object with instance variables as lengths

# Algorithm
  # Initialize Triangle with side error testing. Wrap the testing in an ArgumentError

class Triangle
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @sides = [@s1, @s2, @s3]
    validation
  end

  def validation
    all_valid = sides_numeric && sides_nonzero && sides_valid_length
    raise ArgumentError, "Invalid triangle side lengths" unless all_valid
  end

  def sides_numeric
    sides.each { |side| return false unless side.is_a?(Numeric) }
  end

  def sides_nonzero
    sides.each { |side| return false unless side > 0 }
  end

  def sides_valid_length
    (s1 + s2 > s3) && (s1 + s3 > s2) && (s2 + s3 > s1)
  end

  def kind
    if s1 == s2 && s2 == s3
      'equilateral'
    elsif s1 != s2 && s2 != s3 && s3 != s1
      'scalene'
    else
      'isosceles'
    end
  end

  private

  attr_reader :s1, :s2, :s3, :sides
end
