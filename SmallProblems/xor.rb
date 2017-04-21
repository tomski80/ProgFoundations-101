=begin
def xor?(arg1, arg2)
  if arg1
    return true if !arg2
  end
  if arg2
    return true if !arg1
  end
  false
end
=end

def xor?(arg1, arg2)
  if arg1 && !arg2
    true
  elsif !arg1 && arg2
    true
  else
    false
  end
end




p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)
