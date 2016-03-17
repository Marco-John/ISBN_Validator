def correct_length?(input_string)
	if input_string.length == 10 
		true
	elsif input_string.length == 13 && valid_isbn13?(input_string)
		true
	else
		false
	end
end