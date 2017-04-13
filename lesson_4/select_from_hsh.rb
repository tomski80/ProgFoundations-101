produce = { 'apple' => 'Fruit',
            'carrot' => 'Vegetable',
            'pear' => 'Fruit',
            'broccoli' => 'Vegetable' }

def select_fruit(hsh)
  counter = 0
  fruits = {}
  hsh_keys = hsh.keys
  loop do
    if hsh[hsh_keys[counter]] == 'Fruit'
      fruits[hsh_keys[counter]] = hsh[hsh_keys[counter]]
    end
    counter += 1
    break if counter >= hsh.size
  end
  fruits
end

fruits = select_fruit(produce)

p fruits
