print "What is your name ? "
name = gets
name.chomp!

if name[-1] == '!'
  name.upcase!.delete! "!"
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end
