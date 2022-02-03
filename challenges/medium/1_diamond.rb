class Diamond
  def self.make_diamond(input)
    raise ArgumentError unless input.match?(/\A[a-z]\z/i)

    letter = input.upcase
    size = (letter.ord - 65) * 2 + 1

    return "A\n" if letter == "A"

    diamond = []
    diamond.push("A".center(size), top_half(size))
           .push(bottom_half(size), "A".center(size))
           .flatten.join("\n") + "\n"
  end

  class << self
    private

    # rubocop:disable Metrics/AbcSize
    def top_half(size)
      result = []
      half = size / 2

      1.upto(half) do |num|
        result << (" " * ((half) - num) +
                  (num + 65).chr +
                  " " * (size - (((half) - num) * 2) - 2) +
                  (num + 65).chr +
                  " " * ((half) - num))
      end
      result
    end

    def bottom_half(size)
      result = []
      half = size / 2

      (half - 1).downto(1) do |num|
        result << (" " * ((half) - num) +
                  (num + 65).chr +
                  " " * (size - (((half) - num) * 2) - 2) +
                  (num + 65).chr +
                  " " * ((half) - num))
      end
      result
    end
    # rubocop:enable Metrics/AbcSize
  end
end

# See 1_diamond_b.rb for a simpler way using the book algorithm
