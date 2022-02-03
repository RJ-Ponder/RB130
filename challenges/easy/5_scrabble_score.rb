SCORE = {
  'DG' => 2,
  'BCMP' => 3,
  'FHVWY' => 4,
  'K' => 5,
  'JX' => 8,
  'QZ' => 10,
}

class Scrabble
  def initialize(word)
    @word = word.to_s
  end
  
  def self.score(quick_word)
    Scrabble.new(quick_word).score
  end
  
  def score
    clean = @word.upcase.gsub(/[^A-Z]/, '')
    keys = SCORE.keys
    clean.chars.map do |letter|
      group = ''
      keys.each { |key| group = key if key.include?(letter) }
      SCORE[group] ? SCORE[group] : 1
    end
    .sum
  end
end

# After seeing book solution, refactored my solution:
  # better cleaning, from strip to gsub to clean non-whitespace characters, too
  # grouped letters in Constant rather than breaking out individually
  # used existing constructor and score method in class method