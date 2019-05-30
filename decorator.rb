class Car
  def top_speed
    100 
  end 
end 

class CarWithNitro < Car 
  def top_speed
    super + 30 
  end 
end
 
class CarWithBoost < Car 
  def top_speed 
    super + 50 
  end 
end 



class Nitro
  def initialize(component)
    @component = component
  end 
    
  def top_speed 
    @component.top_speed + 30
  end
end
  
class Boost
  def initialize(component)
    @component = component
  end
   
  def top_speed
    @component.top_speed + 50
  end
end 

class Car1
	def NitroCar
        car = Nitro.new(Car.new).top_speed #130 
        return car
    end
end

class Car2
	def BoostCar
        car2 = Boost.new(Nitro.new(Car.new)).top_speed #180
        return car2
    end
end


require 'test/unit'

class MyTest < Test::Unit::TestCase
	def test_basic
		assert_equal(130,Car1.new.NitroCar)
		assert_equal(180,Car2.new.BoostCar)
	end
end


