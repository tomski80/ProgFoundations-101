puts "Enter the first number:"
num1 = gets.chomp.to_i

num2 = 1
loop do
  puts "Enter the second number:"
  num2 = gets.chomp.to_i
  break unless num2 == 0
end


puts "==> #{num1} + #{num2} = #{num1+num2}"
puts "==> #{num1} - #{num2} = #{num1-num2}"
puts "==> #{num1} * #{num2} = #{num1*num2}"
puts "==> #{num1} / #{num2} = #{num1/num2}"
puts "==> #{num1} % #{num2} = #{num1%num2}"
puts "==> #{num1} ** #{num2} = #{num1**num2}"
