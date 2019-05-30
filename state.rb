$stdout.sync = true

class TrafficLight
	def initialize
		@state = nil
        end

        def next_state(color = Green)
    	        @state = color.new(self)
    	        @state.beep
    	        @state.start_timer
        end
end


class State
        def initialize(light)
    	       @light = light
    	
        end

end


class Green < State
        def beep
 	    puts "color is Green"
 	end

	def next_state
    	   @light.next_state(Yellow)
        end

        def start_timer
    	  sleep 5; next_state
        end
end


class Yellow < State
	def beep
		puts "color is Yellow"
		
	end

	def next_state
		@light.next_state(Red)
	end

	def start_timer
		sleep 5; next_state
	end
end

class Red < State
	def beep
		puts "color is red"
	end
   
        def next_state
           @light.next_state(Green)
        end

        def start_timer
        	sleep 3; next_state
    	
         end
end

tl = TrafficLight.new
tl.next_state



