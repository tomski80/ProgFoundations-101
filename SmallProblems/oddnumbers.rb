
(1..99).each do |num|
  puts num if num.odd?
end

1.upto(99) { |num| puts num if num.odd? }

value = 1
while value <= 99
  puts value
  value += 2
end

arr = (1..99).map { |num| num }
oddnum = arr.select do |num|
  num % 2 != 0
end
puts oddnum
