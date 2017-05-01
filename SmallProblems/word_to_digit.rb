# input string
# output string
# convert words representing digits to actual digits
# split string
# find all the words that represent digits and substitute them for digits
# join new string

DIGITS_WORDS = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
                 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
                 'eight' => '8', 'nine' => '9' }

def word_to_digit(string)
  str = string
  DIGITS_WORDS.keys.each do |word|
    str.gsub!(/\b#{word}\b/,DIGITS_WORDS[word])
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
