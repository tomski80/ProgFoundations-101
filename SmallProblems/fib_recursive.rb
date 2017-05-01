
def fibonacci(n)
  # Fn = (Fn-2) + (Fn-1)
  return 1 if n-2 <= 0
  fibonacci(n-2) + fibonacci(n-1)
end


def fibonacci(n)
  # Fn = (Fn-2) + (Fn-1)
  fn = 1
  fn_2 = 0
  fn_1 = 1
  index = 1
  loop do
    fn = fn_2 + fn_1
    fn_2 = fn_1
    fn_1 = fn
    index += 1
    break if index >= n
  end
  fn
end

def fibonacci(n)
  fn_2,fn_1 = [1,1]
  3.upto(n) do
    fn_2,fn_1 = [fn_1,fn_2 + fn_1]
  end
  fn_1.to_s[-1].to_i
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

PHI = 1.6180339887498948482
def fibonacci_last(n)
  # fib by rounding
  fib = ((PHI**n)/Math.sqrt(5)).round
  fib.to_s[-1].to_i
end
=begin
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
=end
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4
