require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  def test_instance_of_car
      car = Car.new
      assert_instance_of(Vehicle, car)
  end
end