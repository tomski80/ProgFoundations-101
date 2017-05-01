
# to be balanced parantheses need to occur in matching pairs
#
# to be balanced
# - same number of open and closed ()
# - open has to be before closed



def balanced?(string)
  counter = 0
  string.each_char do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'
    break if counter < 0
  end
  counter == 0
end



# examples
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
