items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }
puts
gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end

# Looked at the solution to see exactly the intention. I wasn't sure if 
# I should yield each item one at a time or possibly use the splat operator
# to give each item its own parameter.
# Turns out it was just to yield the entire array for the user to use as needed.