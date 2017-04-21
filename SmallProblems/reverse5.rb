=begin
def reverse_words(string)
  words_arr = string.split(' ')
  words_arr.map! do |word|
    if word.size > 5
      word.split('').reverse.join('')
    else
      word
    end
  end
  words_arr.join(' ')
end

=begin
# rather horrible code!
def reverse_words(string)
  words = string.split(' ')
  words.map! { |word| word.split('') }
  words.map! do |word_arr|
    if word_arr.size > 5
      word_arr.reverse!
    else
      word_arr
    end
  end
  words.map! { |word_arr| word_arr.join('')}
  words.join(' ')
end
=end

def reverse_words(string)
  words = []

  string.split(' ').each do |word|
    word.reverse! if word.size > 5
    words << word
  end
  words.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
