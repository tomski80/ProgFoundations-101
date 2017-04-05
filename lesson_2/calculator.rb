# ask the user for two numbers
# ask the user for an operation to perform
# perform operation on two numbers
# print result

def prompt(messege)
  puts "=>#{messege}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_messege(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Substracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Welcome message and ask for name until NOT empty string given
prompt('Welcome to Calculator! What is your name?')
# keep asking for name until given NOT empty string
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt('Please enter valid name!')
  else
    break
  end
end

puts ''
name.capitalize!
prompt("Hello! #{name}")
puts ''

# this is our main loop
loop do
  prompt('Please enter two numbers to perform caluclation!')
  prompt('Enter first number: ')

  number1 = nil
  loop do
    number1 = gets.chomp.to_i
    if valid_number?(number1)
      break
    else
      prompt('Please enter valid number....')
    end
  end

  prompt('Enter second number: ')

  number2 = nil
  loop do
    number2 = gets.chomp.to_i
    if valid_number?(number2)
      break
    else
      prompt('Please enter valid number....')
    end
  end

  operator_message = <<~MSG
    What operation would you like to perform
    1) add
    2) substract
    3) multiply
    4) divide
      MSG

  prompt(operator_message)
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Please choose 1, 2, 3 or 4')
    end
  end

  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("#{operation_to_messege(operator)} the two numbers...")
  prompt("The result is #{result}")

  prompt("Do you want to calculate some more ? (Y/N)")
  break if gets.chomp.downcase != 'y'
end
