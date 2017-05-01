# input is 2 arrays - list of numbers each
# return NEW array that contains product of each pair
# argument is same number of elements


def multiply_list(array1,array2)
  new_arr = []
  array1.each_with_index { |element,index| new_arr << element*array2[index] }
  new_arr
end

def multiply_list(arr1,arr2)
  p arr1.zip(arr2)
end

#example
p multiply_list([3, 5, 7], [9, 10, 11])

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
