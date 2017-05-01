# input : string (short line of text)
# output : banner with text (ASCII art)

# 1. check how long is give text string.length
# 2. build top line for the banner based on lenght of the string
# 3. build sides of the banner
# 4. build bottom of the banner


def print_char(char,length)
  (1..length+2).each do |_|
    print(char)
  end
end

def print_in_box(string)
  len = string.length

  print('+')
  print_char('-',len)
  puts('+')

  print('|')
  print_char(' ',len)
  puts('|')

  print('| ')
  print(string)
  puts(' |')

  print('|')
  print_char(' ',len)
  puts('|')

  print('+')
  print_char('-',len)
  puts('+')

end

# examples
print_in_box('To boldly go where no one has gone before.')
puts
print_in_box('')
puts
print_in_box('Ala ma kota')
