# check for doulbe number
#  condition
#  number of digits must be even
#  left half == right half

def double?(number)
  size = number.to_s.size
  if number.to_s.size.even?
    number.to_s[0..size/2-1] == number.to_s[size/2..size]
  else
    false
  end
end

def twice(number)
  double?(number) ? number : number*2
end

#check double?(num)
=begin
p double?(3333)
p double?(23)
p double?(333)
p double?(3434)
=end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
