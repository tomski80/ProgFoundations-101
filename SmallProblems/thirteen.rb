require 'date'

def friday_13th?(year)
  f13 = 0
  1.upto(12) do |month|
      f13 += 1 if Date.new(year,month,13).friday?()
  end
  f13
end


p friday_13th?(2015)
p friday_13th?(1986)
