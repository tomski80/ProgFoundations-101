# so middle line is n stars
# every line above is n-2 stars + spaces n - stars
# end every line below is n-2 stars + spaces n - stars

def diamond(n)

  0.upto(n/2) do |index|
  stars = n - (2 * (n/2-index))
  spaces = (n - stars)/2
  puts ' '*spaces + '*'*stars  # middle line
  end

  (n/2-1).downto(0) do |index|
  stars = n - (2 * (n/2-index))
  spaces = (n - stars)/2
  puts ' '*spaces + '*'*stars
  end
end
diamond(21)
