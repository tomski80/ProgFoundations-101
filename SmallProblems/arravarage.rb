
=begin
def average(arr)
  arr.inject(:+) / arr.size
end
=end

def average(arr)
  sum = arr.inject() { |sum, number| sum + number }
  p sum / arr.length
end



puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
