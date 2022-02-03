class TextAnalyzer
  def process
    file_contents = File.read("book_excerpt.txt") # read ensures the file is closed before returning
    yield(file_contents)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |content| puts "#{content.split("\n\n").count} paragraphs" }
analyzer.process { |content| puts "#{content.split("\n").count} lines" }
analyzer.process { |content| puts "#{content.split(" ").count} words" }

# If you don't use read, you can open the file, but then you must make sure to close it after
def process
  file = File.open("sample_text.txt", "r") # The "r" mode makes it read only
  yield(file)
  file.close
end
