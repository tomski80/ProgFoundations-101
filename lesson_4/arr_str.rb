str = 'How do you get to Carnegie Hall?'
arr = str.split

puts arr.join(' ')

str2 = ''
arr.each {|word| str2 << word + ' '  }
puts str2

arr2 = arr.map {|word| word + ' ' }
puts arr2.join
