arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |inner_arr|
  inner_arr.select { |int| int % 3 == 0 }
end

p arr2
