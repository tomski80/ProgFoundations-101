require 'pry'

def triangle(ang_a,ang_b,ang_c)
  angles = [ang_a,ang_b,ang_c]
  case
  when angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  when angles.any? { |ang| ang == 90 }
    :right
  when angles.any? { |ang| ang > 90 }
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


p triangle(60, 70, 50)
p triangle(30, 90, 60)
p triangle(120, 50, 10)
p triangle(0, 90, 90)
p triangle(50, 50, 50)
