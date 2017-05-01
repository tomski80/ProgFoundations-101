def sum_square_difference(num)
  # sum of squars
  sum_of_sqr = 0
  (1..num).each do |n|
    sum_of_sqr += n**2
  end
  #sqr of sum
  sum = 0
  (1..num).each do |n|
    sum += n
  end
  sum = sum**2
  sum - sum_of_sqr
end


p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
