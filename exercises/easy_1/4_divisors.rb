# def divisors(integer)
#   result = []
#   (1..integer).each do |num|
#     result << num if integer % num == 0
#   end
#   result
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Solve this more efficiently
def divisors(integer)
  forward = []
  backward = []
  half = Math.sqrt(integer)
  (1..half).each do |num|
    if integer % num == 0
      forward << num
      backward.unshift(integer / num)
    end
  end
  
  if forward.last == backward.first
    forward.pop
    forward + backward
  else
    forward + backward
  end
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(100)
# p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357)
# p divisors(999962000352)
