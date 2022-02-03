def any?(array)
  return false if array.empty? # not necessary because loop won't start if array is empty
  
  index = 0
  
  while index < array.size do
    return true if yield(array[index]) == true
    index += 1
  end
  
  false
end

# Because my solution uses the element getter method, [], it won't work for collections that have a different implementation of the method, or none at all
# The book solution uses each, reproduced here:

def any?(collection)
  collection.each { |value| return true if yield(value)  }
  false
end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false
p any?([1, 2, 3]) { |value| value }

# Feedback submitted:
# I don't think this sentence in the second paragraph is strictly correct: "If the block returns a value of `true` for any element, then `#any?` returns true."

# Rather, it should say if the block returns a `truthy` value for any element, then `#any?` returns `true`. 

# For example, this will return `true` because the block returns a value other than `false` or `nil` (truthy), even though the block doesn't return a `true` value.

# ```ruby
# [1, 2, 3].any? { |num| num }
# ```