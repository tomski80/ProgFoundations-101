SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
room_length = gets.chomp

puts "Enter the width of the room in meters:"
room_width = gets.chomp

area = room_length.to_f * room_width.to_f
puts "The area of the room is %.2f square meters (%.2f square feet)" % [area, area*SQMETERS_TO_SQFEET]
