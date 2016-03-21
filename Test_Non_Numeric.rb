require 'minitest/autorun'
require_relative 'Non_Numeric.rb'

class TestNonNumeric < Minitest::Test
	  
	
	def test_validity_of_isbn_numbers
		assert_equal(false, input_string("877195x869"))
	end

	
end







