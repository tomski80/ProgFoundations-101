# take one argument (number)
# return opposite

def opposite(number)
  if number > 0
    -number
  else
    number
  end
end


#take string arbument

def uppercase?(string)
  string.upcase == string
end


p opposite(-5)
p opposite(0)
p opposite(5)

p uppercase?("^%$^& 1. Launchschool is OWESOME!!!")
p uppercase?("()%^&&^*&1. LAUNCHSCHOOL IS OWESOME!!!")
