#ISBN Verification Program
  
#Create a program that will determine if a string is a valid ISBN-10 or ISBN-13 number is valid.

require 'minitest/autorun'
require_relative 'ISBN_Validator.rb'

class TestIsbnChecker < Minitest::Test
	  
#1.  ISBN-10 is made up of 9 digits and and a check digit (which may be "x")
#2.  ISBN-13 is made up of 12 digits and a check digit
#3.  Remove spaces and hyphens from string

	def test_string_without_10_or_13_numbers
		assert_equal(false, valid_isbn?(""))
		assert_equal(false, valid_isbn?("123456789123"))
		assert_equal(false, valid_isbn?("12345678912345"))
	end
	
	def test_valid_isbn10_with_spaces_returns_true
		assert_equal(true, valid_isbn?("047 1958 697"))
	end
	
	def test_valid_isbn10_with_hyphens_returns_true
		assert_equal(true, valid_isbn?("0-321-14653-0"))
	end

	def test_valid_isbn10_with_spaces_and_hyphens_returns_true
		assert_equal(true, valid_isbn?(" 047-1958 697-"))
	end
	
	def test_valid_isbn13_returns_true
		assert_equal(true, valid_isbn?("9780470059029"))
	end

	def test_valid_isbn13_with_spaces_and_hyphens_returns_true
		assert_equal(true, valid_isbn?("-9  7---80470059029"))
		assert_equal(true, valid_isbn?("978-0-13-149505-0"))
		assert_equal(true, valid_isbn?("978 0 471 48648 0"))
	end

#ISBN-10

#4.  Multiply each digit by its position
#5.  Sum of all products of each position
#6.  Take modulo 11 of the result
#7.  If the modulo 11 result is 10, then "x" will be the last character in ISBN-10

	def test_convert_string_to_array_of_characters
		assert_equal(["1","2","3","4","5","6","7"],convert_string_to_array("1234567"))
	end

	def test_isbn10_math?
		assert_equal([1,2,3,1], multiply_progression([1,1,1,1]))
	end

	def test_isbn10_addition
		assert_equal(49, sum_of_items([0,4,7,1,9,5,8,6,9,7]))
	end
	
	def test_isbn10_addition_value_mod11
		assert_equal("7", isbn10_mod11(["0","4","7","1","9","5","8","6","9","7"]))
	end
	
	def test_isbn10_mod_equals_10
		assert_equal("x", isbn10_mod11(["8","7","7","1","9","5","8","6","9","10"]))
	end
	
	def test_valid_isbn10
		assert_equal(true, valid_isbn10?("0471958697"))
	end	
	
	
end


#ISBN-13

#8.  Multiply each digit alternately by 1 then 3
#9.  Sum of all products of each position
#10. Take modulo 10 of the result
#11. Subtract the modulo 10 result from 10
#12. Take modulo 10 of the Subtraction result to produce a single digit




