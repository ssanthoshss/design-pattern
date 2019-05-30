require 'json'
module ReportFormatters
  class JSON
    def self.format(data)
      data.to_json
    end
  end
  class PlainText
    def self.format(data)
      data.to_s
    end
  end
  
end

class ReportGenerator
  def self.generate(data, formatter)
    formatter.format(data)
  end
end



class Result
	def Json
		data = { A: 31, B: 24, C: 10 }
        p ReportGenerator.generate(data, ReportFormatters::JSON)
    end
end




require 'test/unit'

class MyTest < Test::Unit::TestCase
	def test_basic
		assert_equal("{\"A\":31,\"B\":24,\"C\":10}",Result.new.Json)
	end
end