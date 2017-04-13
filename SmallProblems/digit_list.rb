def digit_list(num)
  digits = []
  loop do
    digits << num % 10
    num = num / 10
    break if num==0
  end
  digits.reverse
end

p digit_list(375290)
p digit_list(10)
p digit_list(1)
