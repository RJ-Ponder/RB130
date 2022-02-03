class Vehicle
  
end



class Car < Vehicle
  attr_accessor :wheels

  def initialize
    @wheels = 4
  end
end