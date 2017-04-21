NUMBERS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
            6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(num)
  #find digits
  digits = []
  loop do
    digits << num % 10
    num = num / 10
    break if num == 0
  end

  string = ''
  digits.reverse!
  digits.each do |index|
    string << NUMBERS[index]
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
