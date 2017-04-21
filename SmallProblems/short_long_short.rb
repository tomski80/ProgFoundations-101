
=begin
def short_long_short(string1, string2)
  if string1.size < string2.size
    string1 + string2 + string1
  else
    string2 + string1 + string2
  end
end
=end


# just to practice concat method
def short_long_short(string1, string2)
  new_string = ''
  if string1.size < string2.size
    new_string.concat(string1).concat(string2).concat(string1)
  else
    new_string.concat(string2).concat(string1).concat(string2)
  end
end



p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
