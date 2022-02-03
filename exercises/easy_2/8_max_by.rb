def max_by(array)
  return nil if array.empty?
  
  max = yield(array[0])
  current_element = array[0]
  
  array[1..-1].each do |element| # added [1..-1] based on book solution, though not necessary
    current_return = yield(element)
    if current_return >= max # changed > to >= based on book solution, though not necessary
      max = current_return
      current_element = element
    end
  end
  
  current_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil