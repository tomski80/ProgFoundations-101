arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hsh|
  all_keys = hsh.keys
  counter = 0
  loop do
    hsh[all_keys[counter]] = hsh[all_keys[counter]] + 1
    counter += 1
    break if counter == hsh.size
  end
  hsh
end

p arr2
