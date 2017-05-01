# input - array
# output - new array with element rotated (first goes to end of array
# and rest is shifted )
#
# 1.remove firt element and store it (can shift it ?) - shift will also take
# care of shifting remaining elements
# 2.add to end of array stored element

def rotate_array(arr)
  arr_copy = []
  arr.each_with_index {|el,index| arr_copy[index] = el}
  elem = arr_copy.shift()
  arr_copy.push(elem)
end

def rotate_array(arr)
  return arr if arr.size <= 1
  copy = []
  index = 1
  loop do
    copy[index-1] = arr[index]
    index += 1
    break if index >= arr.size
  end
  copy[index-1] = arr[0]
  copy
end

def rotate_array(arr)
  copy = arr.clone
  copy.push(copy.shift)
end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_integers(integer)
  (integer.to_s[1..-1] + integer.to_s[0]).to_i
end

def rotate_rightmost_digits(integer, mov)

end

#examples
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

str = 'ala ma kota'
p rotate_string(str) == 'la ma kotaa'
p str == 'ala ma kota'

int = 105
p rotate_integers(int) == 51
p int == 105


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
