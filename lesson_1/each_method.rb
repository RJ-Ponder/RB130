# The each method iterates through the array, yielding each element to the block, where the block can operate. Then, the method returns the calling object.
[1, 2, 3].each do |element|
  puts element
end


def each(array)
  index = 0
  until index == array.length
    element = array[index]
    yield(element)
    index += 1
  end
  array
end

each([1, 2, 3]) do |element|
  puts element
end

# BOOK WALKTHROUGH
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter]) # yield to the block, passing in the current element to the block
    counter += 1
  end

  array # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end
