# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end

# => 6

# [1, 2, 3].reduce do |acc, num|
#   acc + num if num.odd?
# end

# => NoMethodError: undefined method `+' for nil:NilClass

# [1, 2, 3].reduce(10) do |acc, num|
#   acc + num
# end

# => 16

# First solution for numeric arrays (acc set to 0 if not provided)
# def reduce(array, acc = 0)
#   array.each do |element|
#     acc = yield(acc, element)
#   end
#   acc
# end

# Second solution for all arrays using acc set to first element in array
# Conditions:
# If an initial value is provided, the acc should be set to it and iterate through whole array, starting with first value
# If an initial value is not provided, the acc should be set to the first value in the array, and then iterated through the rest

def reduce(array, acc = 0)
  if acc == 0
    acc = array[0]
    index = 1
    while index < array.size
      acc = yield(acc, array[index])
      index += 1
    end
  else
    array.each do |element|
      acc = yield(acc, element)
    end
  end
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

# Revisiting this problem while studying for the exam, I came up with this:
def reduce(array, acc = (acc_not_passed = true; array[0]))
  array = array[1..-1] if acc_not_passed

  array.each do |element|
    acc = yield(acc, element)
  end

  acc
end

# The argument idiom lets you know if an optional argument was passed in.
# This is to prevent the edge case where an argument was passed in that 
# was the same as your default value (thus shrinking the array)
# in the parenthesis is just an expression and the last expression is the return value 
# So to speak of the expression