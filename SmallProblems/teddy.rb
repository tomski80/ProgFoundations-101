name = ''

puts "Enter name please:"
name = gets.chomp
name = 'Teddy' if name == ''

puts "#{name} is #{rand(20..200)} years old!"
