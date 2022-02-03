# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

def step(start_value, end_value, step_value)
  iteration = start_value
  steps = 0
  while iteration <= end_value
    yield(iteration)
    iteration += step_value
    steps += 1
  end
  steps # I chose this as the return, but book has iteration. Possibly nil or the last return value of the block works, too.
end

p step(1, 10, 3) { |value| puts "Value = #{value}" }