=begin
def stringy(integer)
  char = '1'
  str = ''
  until integer == 0
    str << char
    char = if char == '1'
      '0'
    else
      '1'
    end
    integer -= 1
  end
  str.to_s
end
=end

def stringy(len)
  arr = (1..len).map do |index|
    index.odd? ? '1' : '0'
  end
  arr.join('')
end


=begin
def stringy(len)
  str = ''
  char = '1'
  len.times do
    str << char
    char == '1' ? char = '0' : char = '1'
  end
  str.delete(' ')
end
=end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
