def multiply_all_pairs(arr1,arr2)
  new_arr = []
  arr1.product(arr2) { |prod| new_arr << prod.inject(:*) }
  new_arr.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2])
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
