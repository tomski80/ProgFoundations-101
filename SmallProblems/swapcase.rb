# input string
# return new string where uppercase is replaced with lowercase letters
# same as swapcase but we cannot use it

def swapcase(string)
  letters = string.split('')
  letters.map! do |letter|
    if letter.downcase == letter
      letter.upcase
    else
      letter.downcase
    end
  end
  letters.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
