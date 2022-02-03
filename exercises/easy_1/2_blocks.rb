def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration
def compute2(arg = nil)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute2 { 5 + 3 }
p compute2(1) { |arg| arg + 5 }
p compute2("hi") { |arg| arg + " there" }
p compute2 { |arg| arg }
p compute2