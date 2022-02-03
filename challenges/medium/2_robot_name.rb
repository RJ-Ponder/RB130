# Problem
# Create a Robot class with the following features:
# Robot instances do not have a name until given one (#name)
# Name is randomly generated name with the pattern: RX837 (AA123)
# The name will stick until the name is reset
# The name can be reset (wiped) and a new name generated
# One Robot instance cannot have the same name as another Robot instance

# Examples / Test Cases
# See the test suite

# Data Structures
# The names are strings because they follow a regexp pattern
# Some kind of class variable is needed to make sure names aren't repeated

# Algorithm
# There are two instance methods needed: #name and #reset

class Robot
  @@name_log = []

  def initialize
    @name = nil
  end

  def name
    @name || @name = assign_random_name
  end

  def reset
    @@name_log.delete(@name)
    @name = nil
  end

  private

  def assign_random_name
    random_name = ''
    loop do
      random_name = generate_random_name
      break random_name unless @@name_log.include?(random_name)
    end
    @@name_log << random_name
    random_name
  end

  def generate_random_name
    rand(65..90).chr + rand(65..90).chr + format("%03d", rand(0..999))
  end
end
