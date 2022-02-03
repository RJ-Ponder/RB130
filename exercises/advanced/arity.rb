# For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Observations
# Line 4 creates a proc object using the Kernel#proc method as a shorthand of Proc.new
# Line 5 outputs the proc object encoding
# Line 6 outputs the proc object class - Proc
# Line 7 calls the proc object and demonstrates that arity is lenient, meaning there is no error thrown when there are too many or too few arguments passed in.

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Observations
# Line 17 creates a Proc with lambda semantics using the Kernel#lambda method
# Line 18 creates a Proc with lambda semantics using the Lambda proc literal syntax ( uses -> and arguments in parentheses before the curly braces). This is the same as the first lambda, but created with different syntax
# Line 19 shows the first lambda Proc object encoding (note that Procs that are lambdas have the designation in parenthesis after the encoding)
# Line 20 shows the second lambda Proc object encoding
# Line 21 shows that the Proc is of the Proc class. Lambda is not its own class, but rather a type of Proc
# Line 22 calls the lambda and passes in the string 'dog' to the block parameter
# Line 23 throws an ArgumentError, demonstrating the Lambdas have strict arity
# Line 24 throws a NameError, because Lambda is not a class, but rather a type of Proc, and cannot be created using ::new. The Kernel#lambda method or literal syntax as above should be used instead.

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Observations
# Group 3 defines a method that must take a block. The first method call on line 41 demonstrates that blocks don't have strict arity. The block doesn't have an argument passed in, so the argument is treated as nil. Note that the method parameter, animal, is not used in the method.
# The second method call on line 42 demonstrates that methods defined to take a block without a block checking clause must have a block or else a LocalJumpError is thrown.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# Oberservations
# This last group is similar to before, except the method parameter is passed to the block with the yield keyword.
# The first call on line 53 passes in the string argument 'turtle' to the block which is output.
# The second call on line 54 passes in the string argument 'turtle' to the block and there is also another block parameter missing an argument. The argument is filled in with nil.
# The third call throws a NameError, because there is no defined block parameter and so the variable animal is undefined. (The variable doesn't exist in the block's scope)

# Conclusion
# From RB130, Lesson 1: Blocks, Assignment 4. Writing Methods that take Blocks
# Blocks and procs have lenient arity
# Methods and lambdas have strict arity
# Blocks and procs that have more arguments than parameters are ignored. Less arguments than parameters are filled in with nil. (See Passing Parameters Parts 1, 2, and 3 under Medium 1 exercises for more practice)
# Lambdas are a special type of Proc, where the "lambda-ness" affects argument handling and the behavior of return and break. (from docs)
# Using Kernel#lambda is equivalent to Proc.new, except the resulting Proc objects check the number of parameters passed when called.
# Methods can call blocks with yield, but if yield is supplied the method must be called with a block, unless a block checking clause is present. Additionally, any arguments need to be passed to the block.

# Launch school wording:
# If nothing is passed into the block, nil is assigned to the block variable.