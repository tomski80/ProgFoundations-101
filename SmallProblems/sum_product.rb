def prompt(string)
  puts "=> #{string}"
end

prompt "PLease enter an integer greater than 0"
number = gets.chomp.to_i

prompt "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

if choice == 's'
  result = 0
  name = 'sum'
  (1..number).each { |num| result += num }
else
  result = 1
  name = 'product'
  (1..number).each { |num| result *= num }
end

puts "The #{name} of the integers between 1 and #{number} is #{result}"


def calculate_sum(number)
  (1..number).reduce(:+)
end

def calculate_product(number)
  (1..number).reduce(:*)
end
