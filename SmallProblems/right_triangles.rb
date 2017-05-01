
def triangle(n)
  n.downto(1) do |index|
    puts ' '*(index-1) + '*'*(n-(index-1))
  end
end

triangle(5)
triangle(9)
