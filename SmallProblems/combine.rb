# input takes 2 arrays
# return one array with all the values
# no duplicates please

def merge(array_1, array_2)
  (array_1 + array_2).uniq
end


#examples

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([1,[1,2],3,5],[0,[1,2],6,7])
