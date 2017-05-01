# input array of numbers
# return sum of sums of each leading subsequence
# array always contains at least one numbers
#
# make arr.size new arrays
#
def sum_of_sums(array)
  sum = 0
  array.each_with_index do |elem,index|
    sum += array[0..index].inject(:+)
  end
  sum
end


# examples

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35


p sum_of_sums([3, 5, 2])
p sum_of_sums([1, 5, 7, 3])
p sum_of_sums([4])
p sum_of_sums([1, 2, 3, 4, 5])
