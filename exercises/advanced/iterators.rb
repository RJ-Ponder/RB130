# Create an enumerator object that iterates through factorials with external iteration

# Enumerator::Yielder#yield and Enumerator::Yielder::<< are aliases

# helpful article: http://www.michaelharrison.ws/weblog/2009/09/lazy-enumerators-in-ruby/
# natural_numbers = Enumerator.new do |yielder| 
#   number = 1
#   loop do
#     yielder.yield number  # Calling this 'yield' method will suspend the enumerator and give up control to the enumerating method.
#     number += 1 # this is waiting to be calculated
#   end 
# end

# p natural_numbers.next
# p natural_numbers.next
# p natural_numbers.next
# p natural_numbers.next
# p natural_numbers.next
# puts

# fib = Enumerator.new do |yielder|
#   first = 1
#   second = 1
#   loop do
#     yielder.yield(first)
#     first, second = second, first + second
#   end
# end

# p fib.next
# p fib.next
# p fib.next
# p fib.next
# p fib.next

# My solution before refactoring based on book:
# factorial = Enumerator.new do |yielder|
#   index = 0
  
#   loop do
#     if index == 0 || index == 1
#       yielder.yield(1)
#       index += 1
#     else
#       result = index
#       next_down = index - 1
#       loop do
#         break if next_down <= 0
#         result = result * next_down
#         next_down -= 1
#       end
#       yielder.yield(result)
#       index += 1
#     end
#   end
# end

factorial = Enumerator.new do |yielder|
  number = 0
  result = number
  
  loop do
    result = number == 0 ? 1 : (number * result)
    yielder.yield(result) # alias is yielder << result
    number += 1
  end
end

puts "Showing first 10 elements of the enumerator object"
p factorial.take(10)

puts "======================"

# External iterators (next, peek, next_values, peek_values)
puts "Iterating with an external iterator"
7.times { |number| puts "#{number}! => #{factorial.next}" }

puts "Internal pointer not reset"
3.times { |number| puts "#{number}! => #{factorial.next}" }

puts "Internal pointer reset"
factorial.rewind
7.times { |number| puts "#{number}! => #{factorial.next}" }

puts "======================"

# Internal iterators (each, each_with_index, each_with_object, map, select...)
puts "Iterating with an internal iterator"
factorial.each_with_index do |element, index|
  break if index > 6
  puts "#{index}! => #{element}"
end

# External iterators

# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="
# factorial.rewind
# 6.times { |number| puts "#{number}! == #{factorial.next}" }
# puts "=========================="

# # Internal iterators

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end
