# start looking from number given
# check next odd number if divide by 7
# if so check if digits in it are unique
# if all true then found if not then go to next odd
#


def featured(number)
  loop do
    number += 1
    if number.odd? && (number % 7) == 0
       break if number.to_s.split('').uniq.join('').to_i == number
    end
  end
  number
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987


p featured(12)
p featured(20)
p featured(21)
p featured(997)
p featured(1029)
p featured(999_999)
p featured(999_999_987)
