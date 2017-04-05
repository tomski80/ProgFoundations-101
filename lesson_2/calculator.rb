# ask the user for two numbers
# ask the user for an operation to perform
# perform operation on two numbers
# print result
require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')

def prompt(mes)
  puts "=>#{mes}"
end

def valid_number?(num)
  begin
    n = Integer(num)
  rescue ArgumentError
    begin
      n = Float(num)
    rescue
      false
    end
  end
end

def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Substracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

# Welcome message and ask for name until NOT empty string given
prompt(MESSAGES['welcome'])
# keep asking for name until given NOT empty string
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

puts ''
name.capitalize!
prompt(MESSAGES['greetings'] + "#{name}")
puts ''

# this is our main loop
loop do
  prompt(MESSAGES['numbers_prompt'])
  prompt(MESSAGES['first_number'])

  number1 = nil
  loop do
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt('Please enter valid number....')
    end
  end

  prompt(MESSAGES['second_number'])

  number2 = nil
  loop do
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_message = MESSAGES['op_message']

  prompt(operator_message)
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['op_choice'])
    end
  end

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end


  result = result.to_i if result.to_i.to_f == result

  prompt("#{operation_to_message(operator)}" + MESSAGES['operation_message'])
  prompt(MESSAGES['result_message'] + "#{result}")

  prompt(MESSAGES['repeat'])
  break if gets.chomp.downcase != 'y'
end
