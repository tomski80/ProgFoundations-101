# input is string
# return is hash with 3 entries
#        1. number of lowercase letters
# =>     2. number of uppercase letters
# =>     3. number of other characters

# so we need to count lowercase letters
# upper case letters
# end other characters

def letter_case_count(string)
  lower_c_count = string.count('a-z')
  upper_c_count = string.count('A-Z')
  other_c_count = string.count('^a-zA-Z')
  { lowercase: lower_c_count, uppercase: upper_c_count, neither: other_c_count }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
