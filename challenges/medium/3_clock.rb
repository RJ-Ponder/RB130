class Clock
  attr_reader :hours, :minutes
  attr_accessor :total_minutes, :normalized_minutes, :new_hours, :new_minutes
  
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end
  
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    convert
  end

  def convert
    self.total_minutes = hours * 60 + minutes
    self.normalized_minutes = total_minutes % 1440
    self.new_hours, self.new_minutes = normalized_minutes.divmod(60)
  end

  def +(min)
    Clock.new(hours, minutes + min)
  end

  def -(min)
    Clock.new(hours, minutes - min)
  end

  def ==(other_time)
    to_s == other_time.to_s
  end

  def to_s
    format('%02d:%02d', new_hours, new_minutes)
  end
end

# Modulo operations return a positive integer when the second operand is 
# positive, and a negative integer when the second operand is negative.
# Since the second operand is always positive (1440), this works without a loop
# However, some people's preference is to never use % when there is a
# possibility that either operand is negative, because it can be confusing, and 
# % operators work differently depending on the language.
# A work around is to do something similar to the book solution with a loop that
# adds or subtracts 1440 until within the range of 0-1339
