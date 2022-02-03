# Problem
# Determine the number of differences between an original DNA strand and supplied one

# Examples / Test Cases
# No difference between empty strands
  # '' == ''
# No difference between identical strands
  # 'GGACTGA' == 'GGACTGA'
# Extra length on supplied strand is ignored
# Extra length on original strand is also ignored

# Data Structures
  # A new DNA strand has the nucleic sequence stored as a string
  # Possibly convert to an array to compare
  
# Algorithm
  # Create a class called DNA
  # Initialize with a sequence string
  # Validate the string so that it only contains G, A, T, C
  # Create the method #hamming_distance that also validates the string
# Hamming Distance Comparison Algorithm
  # determine the length of both strands
  # use the shorter of the two as the bounds for your comparison
  # iterate through one strand, comparing it to the other
  # Add to a counter if there is a difference
  # end the comparision (iteration) at the shorter bound

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
    validate(@strand)
  end

  def validate(sequence)
    valid_class = (sequence.class == String)
    valid_content = (sequence.empty? || sequence.match?(/\A[gtca]+\z/i))
    valid_strand = valid_class && valid_content
    raise ArgumentError, "Invalid DNA sequence." unless valid_strand
  end

  def hamming_distance(supplied_strand)
    validate(supplied_strand)
    length = [strand.size, supplied_strand.size].min
    distance = 0
    index = 0
    loop do
      distance += 1 unless strand[index] == supplied_strand[index]
      index += 1
      break if index >= length
    end
    distance
  end
end
