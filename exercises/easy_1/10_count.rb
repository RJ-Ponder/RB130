# Write a method to count the number of elements in an array for which the block returns true
def count(array)
  count = 0
  array.each { |element| count += 1 if yield(element) }
  count
end

# Further Exploration
# Write a version of the count method that meets the conditions of this exercise, but also does not use each, loop, while, or until.

# My example may not be the intention of the FE, another loop construct
# def count(array)
#   count = 0
#   for element in array
#     count += 1 if yield(element)
#   end
#   count
# end

# Reproducing some other students' creative solutions from memory:
# Using select, size
# def count(array)
#   array.select { |element| yield(element) }.size
# end

# Using upto (could also use times similarly)
# def count(array)
#   count = 0
#   0.upto(array.size - 1) { |index| count += 1 if yield(array[index]) }
#   count
# end

# Using partition
# def count(array)
#   array.partition { |element| yield(element) }.first.size
# end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2