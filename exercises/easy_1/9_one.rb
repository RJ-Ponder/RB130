# Note in particular that #one? will stop searching the collection the second time the block returns true.
# (I solved it using count, but forgot about the above requirement)
# Below is fixing this issue

def one?(collection)
  true_count = 0
  collection.each do |element|
    true_count += 1 if yield(element)
    return false if true_count == 2
  end
  true_count == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } == false
p one?([1, 3, 5, 7]) { |value| false } == false
p one?([]) { |value| true } == false