class SumOfMultiples
  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end

  def self.to(end_point)
    SumOfMultiples.new().to(end_point)
  end

  def to(end_point)
    range = (1...end_point).to_a

    multiples = []

    range.each do |number|
      @factors.each do |factor|
        multiples << number if number % factor == 0 && multiples.last != number
      end
    end

    multiples.sum
  end
end
