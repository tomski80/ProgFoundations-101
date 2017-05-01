# input string (at least 2 words)
# return next to last word string


def penultimate(string)
  words = string.split(' ')
  words[-2]
end

# edge cases input:
# - empty string
# - even number of words
# - one word in the string


def middle_word(string)
  words = string.split(' ')
  size = words.size
  if size == 0
    "Invalid input! Empty string!"
  elsif size.even?
    "Invalid input! Even number of words in sentance!"
  elsif size == 1
    "Invalid input! Only one word in the string!"
  else
    words[-(size/2)-1]
  end
end

# examples
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle_word('') == "Invalid input! Empty string!"
p middle_word('word') == "Invalid input! Only one word in the string!"
p middle_word('first second') == "Invalid input! Even number of words in sentance!"
p middle_word('first second third!') == 'second'
