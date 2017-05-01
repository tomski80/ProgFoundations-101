# input: string with words separated by one or more spaces
#
# return : hash that shows number of words of different sizes
#           - keys is word(s) lenght
#           - value is number of 'key' lenght words
# 1.so we can split string into array of words
# 2.we can map array to integers representing lenghts of words
# 3.we can sort arrray (integers)
# 4.we can now return new array with unique values to make them keys of hash
# 4.no now for each element of this unique values we can count
#   how many of them in array of integers

# how do we handle empty string ?
# if string is empty then return empty hash

def word_sizes(string)
  hsh = {}
  return hsh if string.length == 0

  words = string.split
  words_lenght = words.map do |word|
    word.size
  end
  keys = words_lenght.uniq

  keys.each do |key|
    hsh[key] = words_lenght.count(key)
  end

  hsh
end

=begin
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
=end


# modified version that doesn't count non letter characters
def word_sizes2(words_string)
  words_string.gsub!(/[^a-zA-Z ]/,'')
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

# examples
p word_sizes('ala ala ala ala ') == {3 => 4}
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}


p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}
