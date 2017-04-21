=begin
def leap_year?(year)
  if year % 4 == 0 && year % 100 == 0 && year % 400 == 0
    true
  elsif year % 4 == 0 && year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end
=end

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        return true
      end
      return false
    end
    return true
  end
  return false
end

def leap_year?(year)
  if year % 4 == 0 && year < 1752
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end


=begin
p  leap_year?(2016) == true
p  leap_year?(2015) == false
p  leap_year?(2100) == false
p  leap_year?(2400) == true
p  leap_year?(240000) == true
p  leap_year?(240001) == false
p  leap_year?(1900) == false
p  leap_year?(1752) == true
p  leap_year?(1700) == false
p  leap_year?(1) == false
p  leap_year?(100) == false
p  leap_year?(400) == true
=end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
