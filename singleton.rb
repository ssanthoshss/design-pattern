require 'singleton'

class Lazy
  include Singleton
end


class Single
	def test_single
           ObjectSpace.each_object(Lazy){} # => 0
		Lazy.instance                   # => #<Lazy:0x00007fc25a1b8d10>
		p ObjectSpace.each_object(Lazy){} # => 1
     end
end


require 'test/unit'

class MyTest < Test::Unit::TestCase
	def test_basic
		assert_equal(1,Single.new.test_single)
		
	end
end


