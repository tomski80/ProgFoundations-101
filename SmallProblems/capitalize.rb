# input string
# return string with every word capitalized


def word_cap(string)
  string.split(' ').each { |word| word.capitalize! }.join(' ')
end

def word_cap(string)
  string_cap = string.split(' ').map do |word|
    word.capitalize
  end
  string_cap.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
