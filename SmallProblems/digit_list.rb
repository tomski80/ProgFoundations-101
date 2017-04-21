#
#  3 version of same method
#

=begin
def digit_list(num)
  digits = []
  loop do
    digits << num % 10
    num = num / 10
    break if num==0
  end
  digits.reverse
end


def digit_list(num)
  digits = []
  until num==0 do
    digits << num % 10
    num = num / 10
  end
  digits.reverse
end
=end

def digit_list(num)
  num.to_s.split('').map { |digit|  digit.to_i }
end


puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
