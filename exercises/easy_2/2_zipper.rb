# def zip(array_1, array_2)
#   arr1 = array_1.dup
#   arr2 = array_2.dup
  
#   result = []
  
#   until arr2.empty?
#     result << [arr1.shift, arr2.shift]
#   end
  
#   result
# end

# a = [1, 2, 3]
# b = [4, 5, 6]
# p zip(a, b) #== [[1, 4], [2, 5], [3, 6]]
# p a
# p b

# Another solution that doesn't make a copy of the argument
def zip(arr1, arr2)
  index = 0
  result = []
  loop do
    break if index == arr2.size
    result << [arr1[index], arr2[index]]
    index += 1
  end
  result
end

a = [1, 2, 3]
b = [4, 5, 6]
p zip(a, b) #== [[1, 4], [2, 5], [3, 6]]
p a
p b