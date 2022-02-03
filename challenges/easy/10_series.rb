class Series
  def initialize(string)
    @string = string
  end

  def slices(digits)
    raise ArgumentError if digits > string.length
    
    result = []
    numbers = string.chars.map { |num| num.to_i }
    numbers.each_cons(digits) { |series| result << series }
    result
  end
  
  private
  
  attr_reader :string
end

# The book has a more elegant solution that uses some shortcuts:
# string.chars.map(&:to_i).each_cons(digits).to_a
# This uses the proc to block syntax
# Also takes advantage of the to_a method on the returned Enumerator object