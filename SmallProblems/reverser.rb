
def reverse_sentence(string)
  string.split(' ').reverse!.join(' ')
end

=begin
def reverse_sentence(string)
  arr = string.split(' ')
  reversed = []
  loop do
    reversed << arr.pop
    break if arr.size == 0
  end
  reversed.join(' ')
end
=end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
