
# def crunch(string)
#   string.squeeze(string)
# end

#looped way
def crunch(string)
    index = 0
    crunch_text = ''
    loop do
      crunch_text << string[index] unless string[index] == string[index+1]
      break if index == string.size
      index += 1
    end
    crunch_text
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
