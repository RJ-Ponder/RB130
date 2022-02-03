# This uses the book algorithm, created before seeing solution

class Diamond
  def self.make_diamond(letter)
    range = ("A"..letter).to_a + ("A"...letter).to_a.reverse
    result = []
    width = (letter.ord - 65) * 2 + 1
    range.each do |current_letter| # each with object would be helpful here
      result << make_row(current_letter).center(width)
    end
    result.join("\n") + "\n"
  end

  class << self
    def make_row(current_letter)
      return 'A' if current_letter == 'A'
      current_letter + " " * spaces(current_letter) + current_letter
    end

    def spaces(current_letter)
      return 0 if current_letter == 'A'
      (current_letter.ord - 65) * 2 - 1
    end
  end
end
