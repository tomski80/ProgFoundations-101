

def substring(string, start_num, end_num )
  max_num = string.size-1
  end_num = max_num if end_num > max_num
  start_num = max_num if start_num > max_num
  start_num = 0 if start_num < 0
  string[start_num,end_num-start_num+1]
end

p substring('honey', 0, 2)
p substring('honey', 1, 9)
