# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# def missing(array)
#   range = (array.first..array.last)
#   array_of_range = range.to_a
#   array_of_range.difference(array)
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# Further Exploration:
# Look up Enumerable#each_cons and #Enumerable#each_slice
# Solve this problem using #Enumerable#each_cons

def missing2(array)
  result = []
  array.each_cons(2) do |set| # can also delineate |first, second|
    result += (set.first + 1..set.last - 1).to_a
  end
  result
end

p missing2([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) #== []
p missing2([1, 5]) #== [2, 3, 4]
p missing2([6]) #== []

# [1, 2, 3, 4, 5, 6].each_cons(3) { |f, s, t| puts "#{f} / #{s} / #{t}" }