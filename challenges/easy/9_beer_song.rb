class BeerSong
  def self.verse(start_verse, end_verse = start_verse)
    raise ArgumentError unless valid?(start_verse, end_verse)

    verse_range = (end_verse..start_verse).to_a.reverse
    verse_range.map do |num|
      case num
      when 2 then verse_two
      when 1 then verse_one
      when 0 then verse_zero
      else verse_all(num)
      end
    end.join("\n")
  end

  def self.verses(start_verse, end_verse)
    verse(start_verse, end_verse)
  end

  def self.lyrics
    BeerSong.verse(99, 0)
  end

  class << self
    private

    def valid?(start_verse, end_verse)
      range = (0..99).to_a
      valid_start = range.include?(start_verse)
      valid_end = range.include?(end_verse)
      valid_range = start_verse >= end_verse
      valid_start && valid_end && valid_range
    end

    def verse_all(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the " \
      "wall.\n"
    end

    def verse_two
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def verse_one
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def verse_zero
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
