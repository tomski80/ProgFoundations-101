require 'pry'
=begin
def running_total(arr)
  return [] if arr.size == 0
  total = [arr[0]]
  counter = 0
  until counter == arr.size-1
    counter += 1
    total << total[counter-1] + arr[counter]
    break if counter == arr.size
  end
  total
end
=end


=begin
def running_total(arr)
  running_sum = 0
  sums_arr = []
  arr.each do |num|
    sums_arr << running_sum += num
  end
  sums_arr
end
=end

def running_total(arr)
  sum = 0
  arr.map do { |num| sum+=num }
end



p running_total([2, 5, 13]) == [2, 7, 20]

 p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
 p running_total([3]) == [3]
 p running_total([]) == []
