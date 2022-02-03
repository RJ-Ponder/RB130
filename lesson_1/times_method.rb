# The output is 0 to 4 (one less than calling object)
# Return value is the calling object, 5.

def times(integer)
  num = 0
  until num == integer
    yield(num)
    num += 1
  end
  integer
end

times(5) do |num|
  puts num
end

# BOOK WALKTHROUGH
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5
5.times do |num|
  puts num
end
