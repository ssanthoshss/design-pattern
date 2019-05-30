require 'observer'

$stdout.sync = true

class WeatherStation
	include Observable


	def initailize
		@weather = get_weather
	end


	def check_weather
		current_weather = get_weather

		if @weather != current_weather
			changed
                 @weather = current_weather
	         notify_observers(current_weather)
		end

		sleep 3
		check_weather
	end

	private

	def get_weather
		%w(windy rainy sunny).sample
	end
end


class WeatherAlert
	def update(weather)
		puts "[#{Time.now} New weather: #{weather}"
	end
end


station = WeatherStation.new
alert = WeatherAlert.new

station.add_observer(alert)

station.check_weather
