# input array of strings
# output is array of strings with vowels removed

VOWELS = ['a', 'e', 'i', 'o', 'u']

=begin
def remove_vowels(string_arr)
  arr = string_arr
  arr.each do |word|
    VOWELS.each do |vowel|
       word.delete!(vowel)
       word.delete!(vowel.upcase)
    end
  end
end
=end

def remove_vowels(string_arr)
  string_arr.each do |word|
    word.gsub!(/[aeiou]/i,'')
  end
end


# examples
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
