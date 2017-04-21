# def palindromic_number?(integer)
#   integer.to_s.split('').reverse.join('') == integer.to_s
# end

=begin
def palindromic_number?(int)
  #create array with digits
  digits = []
  until int == 0
    digits << int % 10
    int = int / 10
  end
  digits == int
end
=end
def palindromic_number?(integer)
  int_to_string = integer.to_s
  if integer == int_to_string.to_i
    true
  else
    false
  end
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
