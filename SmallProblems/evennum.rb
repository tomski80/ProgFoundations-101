
(1..99).each do |num|
  puts num if num.even?
end

1.upto(99) { |num| puts num if num.even? }

arr = (1..99).map { |num| num }
arr.select! { |num| num % 2 == 0 }
puts arr
