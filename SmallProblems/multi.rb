def multiply(int1, int2)
  int1 * int2
end

def power_of_n(number,n)
  power = number
  (n-1).times { power = multiply(power,number) }
  power
end

puts multiply(5,3)
puts power_of_n(2,4)
