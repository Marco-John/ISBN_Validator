require 'csv'

CSV.foreach('ISBN_Numbers.csv') do |row|
  puts "#{row}"
end