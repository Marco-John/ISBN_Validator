def valid_isbn?(input_string)
	if input_string.length == 10 
		true
	elsif input_string.length == 13
		true
	else
		false
	end	
end