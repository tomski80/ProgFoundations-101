# input 2 arrays - same size
# return 1 new array
# alternate elements



def interleave(array1,array2)
  new_arr = []
  array1.each_with_index do |_,index|
    new_arr << array1[index]
    new_arr << array2[index]
  end
  new_arr
end

def interleave(arr1,arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
