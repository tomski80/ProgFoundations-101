require 'pry'
=begin
def char_to_digit(char)
  chr_digit = { '0' => 0, '1' => 1, '2' => 2, '3' => 3,
                '4' => 4, '5' => 5, '6' => 6,
                '7' => 7, '8' => 8, '9' => 9 }
  chr_digit[char]
end
=end


def string_to_digits(string)
    digits = []
    string.each_byte { |c| digits << c-48 }
    digits
end

=begin
def string_to_integer(string)
  num_arr = string.split('').reverse
  number = 0
  num_arr.each_with_index do |chr,index|
    number += char_to_digit(chr) * ( 10 ** index )
  end
  number
end
=end
def string_to_integer(string)
  arr = string_to_digits(string)
  num = 0
  arr.reverse.each_with_index do |digit, index|
    num += digit * ( 10 ** index )
  end
  num
end

=begin
def string_to_signed_integer(string)
  string_arr = string.chars
  sign = string_arr.shift

  if sign == '+'
    sign = 1
    string = string_arr.join('')
  elsif sign == '-'
    sign = -1
    string = string_arr.join('')
  else
    sign = 1
  end

  arr = string_to_digits(string)
  num = 0
  arr.reverse.each_with_index do |digit, index|
    num += digit * ( 10 ** index )
  end
  num*sign
end
=end

def string_to_signed_integer(string)
  first = string[0]
  sign = 1
  sign = -1 if first == '-'

  string.gsub!(/\+|\-/,'')
  arr = string_to_digits(string)

  num = 0
  arr.reverse.each_with_index do |digit, index|
    num += digit * ( 10 ** index )
  end
  num*sign
end

HEX_DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
           'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 }

def hexadecimal_to_integer(string)
    digits = string.downcase.chars.map { |char| HEX_DIGITS[char] }

    value = 0
    digits.each { |digit| value = value*16 + digit }
    value
end

p string_to_integer('4321')
p string_to_integer('570')

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

p hexadecimal_to_integer('4D9f') == 19871

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')
