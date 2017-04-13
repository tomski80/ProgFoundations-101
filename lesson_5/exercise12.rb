arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |inner_arr|
  hsh[inner_arr[0]] = inner_arr[1]
end

p hsh
