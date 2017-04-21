vehicles = ['car', 'car', 'truck', 'car', 'SUV',
            'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
  arr.uniq.each do |elem|
    puts elem +' => ' + arr.count(elem).to_s
  end
end

=begin
def count_occurrences(arr)
  uniq_elem = {}

  arr.each do |elem|
    uniq_elem[elem] = arr.count(elem)
  end

  uniq_elem.each do |elem, count|
    puts "#{elem} => #{count}"
  end
end
=end

count_occurrences(vehicles)
