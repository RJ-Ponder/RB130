# & converts procs to blocks automatically
# e.g. comparator = proc { |a, b| b <=> a }, array.sort(&comparator)
# However, if the object is not a proc, it first attempts to call the to_proc method on the object. When it is used with a symbol, Ruby creates a proc that calls the method indicated by the symbol. Then the proc is converted to a block.
# Note that & as a method parameter causes the thing to be converted to a proc

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# The Object#method turns the method into a Method object, which is turned into a Proc

# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# # ->

# Proc.new { |n| n.to_s(8).to_i }
# #when we use & to convert our Proc to a block, it expands out to...

# # ->
# [8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# Expected return value of map
# [10, 12, 14, 16, 20, 41]
