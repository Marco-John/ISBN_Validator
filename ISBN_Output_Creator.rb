require_relative
require 'csv'

file = File.open('duplicate_usbn_examples.csv', 'w')

CSV.foreach('isbn_numbers.csv') do |row|
	if row[0] == "ITEM"
		file << row[0].to_s = ", " + row[1].to_s + ", " + "CHECKS" + "\n"
        else 
		file << row[0].to_s = ", " + row[1].to_s + ", " + "YES" + "\n"
	end
end


file.close