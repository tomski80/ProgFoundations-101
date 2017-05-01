# input integer representing number of digits in fibonacci to find index of
# outpu is integer representing index
#
# simple solution is to calculate fibonacci
# and check number of digits at every iteration
# if its same as given number of digits then that the number we looking for
# so output it


def find_fibonacci_index_by_length(num_digits)
  # Fn = (Fn-2) + (Fn-1)
  fn_2 = 1
  fn_1 = 1
  index = 2
  loop do
    index += 1
    fn = fn_2 + fn_1
    fn_2 = fn_1
    fn_1 = fn
    #check how many digits
    break if fn.to_s.length >= num_digits
  end
  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
