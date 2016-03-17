def valid_isbn?(input_string)
	remove_spaces_and_hyphens(input_string)
	correct_length?(input_string)
end

def remove_spaces_and_hyphens(input_string)
	input_string.delete!(" ")
	input_string.delete!("-")
end

def correct_length?(input_string)
	if input_string.length == 10 
		true
	elsif input_string.length == 13
		true
	else
		false
	end	
end