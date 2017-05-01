# input is array of integers
# mulitply all numbers together, divide by number of elements,
# print result rounded to 3 decimal spaces


def show_multiplicative_average(array)
   result = ((array.reduce(:*)/array.size.to_f)).round(3)
   puts "The result is %0.3f" % [result]
end


#examples

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
