# ask the user for two numbers
# ask the user for an operation to perform
# perform operation on two numbers
# print result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp().to_i()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp().to_i()

Kernel.puts("What operation would you like to perform? 1) add 2) substract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

case operator
when '1'
  result = number1 + number2
when '2'
  result = number1 - number2
when '3'
  result = number1 * number2
else
  result = number1.to_f / number2.to_f
end

puts("The result is #{result}")
