def non_numeric_characters(input_string)
    
    if input_string.length == 10 
        x = input_string[0..8] =~ /\D/
        puts x
        if x == nil
            true
        else
            false
        end	
    else input_string.length == 13  
        y = input_string[0..12] =~ /\D/
        puts y
        if y == nil
            true
        else
            false
        end      
    end
    
end

non_numeric_characters(")


#if input_string.length == 10 
#		valid_isbn10?(input_string)
#	elsif input_string.length == 13
#		valid_isbn13?(input_string)
#	else
#		false
#	end	