def valid_isbn?(input_string) # Validation Functions in correct_length?"
	remove_spaces_and_hyphens(input_string)
	#non_numeric_characters(input_string)
	correct_length?(input_string)
end

def remove_spaces_and_hyphens(input_string)
	input_string.delete!(" ")
	input_string.delete!("-")
	input_string
end

def correct_length?(input_string)
	if input_string.length == 10 
		valid_isbn10?(input_string)
	elsif input_string.length == 13
		valid_isbn13?(input_string)
	else
		false
	end	
end

def valid_isbn10?(input_string)
	array = convert_string_to_array(input_string)
	checksum = isbn10_mod11(array)
	checksum == input_string[-1]
end

def valid_isbn13?(input_string)
	last_num = input_string[-1]
	isbn13_checksum(input_string) == last_num.to_i
end

# Math for ISBN 10 --------------------------------

def convert_string_to_array(input_string)
	input_string.split("")
end
def isbn10_mod11(input_array)
	add_array = multiply_progression(input_array)
	y = sum_of_items(add_array)
	check_sum = y%11
	if check_sum == 10
		"x"
	else
		check_sum.to_s
	end
end
def multiply_progression(input_array)
	array =[]
	items_to_be_summed = input_array.length - 1
	input_array.each_with_index do |value,index|
		value = value.to_i
		if index < items_to_be_summed
		array << value * (index + 1)
		else
		array << value
		end
		end
	array
end

def sum_of_items(array_of_numbers)
	sum = 0
	items_to_be_summed = array_of_numbers.length - 1
	array_of_numbers.each_with_index do |value, index|
		break if index == items_to_be_summed
		sum = sum + value
	end
	sum
end

# Math for ISBN 13 --------------------------------

def valid_isbn13?(input_string)
	last_num = input_string[-1]
	isbn13_checksum(input_string) == last_num.to_i
end

def isbn13_checksum(input_string)
	array = convert_string_to_array(input_string)
	x_array = multiply_array(array)
	summed_array = sum_of_items(x_array)
	subtraction(summed_array)
end

def multiply_array(input_array)
	array = []
	input_array.each_with_index do |value,index|
		value = value.to_i
		if index % 2 == 0
			array << value * 1 
		else 
			array << value * 3
		end
	end
	array
end 

def subtraction(sum_of_items)
	isbn13_mod10 = 10 - sum_of_items%10
	isbn13_mod10%10
end



#def non_numeric_characters(input_string)
#    
#    if input_string.length == 10 
#        x = input_string[0..8] =~ /\D/
#        if x == nil
#            true
#        else
#            false
#        end	
#    else input_string.length == 13  
#        y = input_string[0..12] =~ /\D/
#        if y == nil
#            true
#        else
#            false
#        end      
#    end
#    
#end

