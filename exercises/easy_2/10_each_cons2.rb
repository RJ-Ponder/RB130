def each_cons(array, group_size)
  array.each_with_index do |element, index| # since the element isn't used, each_index would be better
    break if index + group_size - 1 >= array.size
    group = array[index, group_size] # or [index..index + group_size - 1]
    yield(*group)
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash #== { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash #== { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash #== { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash #== {}

# def yield_test(array)
#   yield(*array)
# end

# yield_test([0, 1, 2, 3]) { |a, b, c| puts "#{a} and #{b} and #{c}" }