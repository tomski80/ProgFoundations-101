# input is string of words - separated by spaces
# we need to return string where first and last letter of every word is swapped
#
# 1. we can split string to array of words
# 2. we can iterate through each word swap letters in words(strings)
#
#       - we can acces letters in words by index using size to get last letters
#         index
# 3. we need to return string - we can use join to convert array to string

def swap(string)
  words = string.split
  words.each do |word|
    first_character = word[0]
    word[0] = word[word.size-1]
    word[word.size-1] = first_character
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
