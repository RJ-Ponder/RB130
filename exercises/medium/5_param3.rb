items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)
# gather(items) do | *first_three, fourth |
#   puts first_three.join(", ")
#   puts fourth
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)
# gather(items) do | first, *second_third, fourth |
#   puts first
#   puts second_third.join(", ")
#   puts fourth
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)
# gather(items) do | first, *last_three |
#   puts first
#   puts last_three.join(", ")
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)
gather(items) do | first, second, third, fourth |
  puts "#{first}, #{second}, #{third}, #{fourth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!