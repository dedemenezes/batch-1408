require "csv"

# TODO - let's read/write data from beatles.csv

# PARSING CSV WITHOUT HEADERS
CSV.foreach('data/beatles.csv', headers: :first_row) do |row|
  # p row #=> ["First Name","Last Name","Instrument"]
  # puts "#{row[0]}, #{row[1]}, #{row[2]}"
end

# PARSING CSV WITH HEADERS
CSV.foreach('data/beatles.csv', headers: :first_row) do |row|
  # p row #=> #<CSV::Row "First Name":"John" "Last Name":"Lennon" "Instrument":"Guitar">
  puts "#{row["First Name"]}, #{row["Last Name"]}, #{row["Instrument"]}"
end

# puts is used to print stuff to an user
# p is used mostly for debugging

# STORING
CSV.open('data/beatles.csv', "wb") do |csv|
  # IN CSV WE CAN ONLY STORE ARRAYS OF STRING!!!
  csv << ["First Name", "Last Name", 'Instrument']
  csv << ["John", "Lennon", "Guitar"]
  csv << ["Paul","McCartney","Bass Guitar"]
end
