require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text_file = File.open("sample_text.txt", "r")
    @text_class = Text.new(@text_file.read)
  end
  
  def test_swap # I decided to test this by comparing the count of a and e before and after and the swap method. The book solution compares it to the full actual text.
    a_count = @text_class.text.count('a')
    e_count = @text_class.text.count('e')
    
    swap_text = @text_class.swap('a', 'e')
    
    a_swap_count = swap_text.count('a')
    e_swap_count = swap_text.count('e')
    
    assert_equal(0, a_swap_count)
    assert_equal(a_count + e_count, e_swap_count)
  end
  
  def test_word_count
    assert_equal(72, @text_class.word_count)
  end
  
  def teardown
    @text_file.close
    puts "File has been closed: #{@text_file.closed?}"
  end
end