=begin
def sum(integer)
  arr = integer.to_s.split('')
  arr.map! { |digit| digit.to_i }
  sum = arr.reduce do |sum, num|
    sum + num
  end
end
=end

def sum(integer)
  arr = integer.to_s.split('')
  arr.map! { |char| char.to_i }
  arr.inject(:+)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
