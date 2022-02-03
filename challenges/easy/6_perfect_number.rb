class PerfectNumber
  def self.classify(number)
    validate(number)
    aliquot = divisors_sum(number)
    if aliquot > number
      'abundant'
    elsif aliquot < number
      'deficient'
    else
      'perfect'
    end
  end
  
  class << self # this idiom lets you operate on the class itself as an object. This is so we can create private class methods.
    private
    
    def validate(number) # these are instance methods of the class object, which are used effectively like class methods
      raise StandardError unless number.class == Integer && number > 0
    end
    
    def divisors_sum(number)
      divisors = []
      1.upto(number - 1) do |n|
        divisors << n if number % n == 0
      end
      divisors.sum
    end
  end
end