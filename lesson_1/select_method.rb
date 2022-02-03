array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }       # => [1, 3, 5]
p array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
p array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def select(array)
  selected_array = []
  index = 0
  
  while index < array.length
    return_value = yield(array[index])
    selected_array << array[index] if return_value
    index += 1
  end
  
  selected_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? } # => [1, 3, 5]
p select(array) { |num| puts num } # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }  # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# BOOK SOLUTION
def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end