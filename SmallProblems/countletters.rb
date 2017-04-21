puts "Please write word or multiple words: "
string = gets.chomp

number = string.gsub(' ','').size
puts "There are #{number} characters in \"#{string}\" "
