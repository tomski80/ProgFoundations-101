#input - array
#return -new reversed array

# 1. create empty array
# 2. loop trough given array and put elements in new array in reverse order

def reverse(arr)
  new_arr = []
  (0...arr.size).each do |index|
    new_arr[index] = arr[arr.size-index-1]
  end
  new_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true
