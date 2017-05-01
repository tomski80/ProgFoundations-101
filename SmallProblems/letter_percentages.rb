# input string
# output is hash { lowercase: %, uppercase: %, neither: % }
# count the lowercase letters
# count uppercase letters
# count other characters
# calculate percentages
# put it hash

def letter_percentages(string)
  uppercase_count = string.count('A-Z')
  lowercase_count = string.count('a-z')
  other_count = string.count('^A-Za-z')
  all = uppercase_count + lowercase_count + other_count
  uppercase_percentage = uppercase_count.to_f/all*100
  lowercase_percentage = lowercase_count.to_f/all*100
  other_percentage = other_count.to_f/all*100
  {lowercase: lowercase_percentage, uppercase: uppercase_percentage,
   neither: other_percentage }
end


p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
