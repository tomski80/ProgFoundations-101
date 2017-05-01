


def triangle(side_a, side_b, side_c)
  side_a, side_b, side_c = [side_a, side_b, side_c].sort.reverse
  if side_a < side_b + side_c &&
     side_a > 0 && side_b > 0 && side_c > 0

    if side_a == side_b && side_b == side_c
      :equilateral
    elsif side_a != side_b && side_b != side_c && side_a != side_c
      :scalene
    else
      :isosceles
    end

  else
    :invalid
  end
end


#examples

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
