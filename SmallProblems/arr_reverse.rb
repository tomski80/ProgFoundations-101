# input is an array
# output is same array but with elements in reversed order (mutated array)
#
# my idea is
# first make new array with reversed elements
# - we iterate from last to first element and put it in new array from begining
#
# next step is to put elements in original array using #[]= method
#

def reverse!(arr)
  copy = []
  cp_index = arr.size-1
  (0...arr.size).each do |arr_index|
    copy[arr_index] = arr[cp_index]
    cp_index -= 1
  end
  copy.each_with_index do |el, index|
    arr[index] = el
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []
