class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(list)
    reject_same = list.reject { |anagram| anagram.downcase == @word.downcase }
    
    sorted_word = @word.downcase.split('').sort.join
    
    reject_same.select do |anagram|
      anagram.downcase.split('').sort.join == sorted_word
    end
  end
end
