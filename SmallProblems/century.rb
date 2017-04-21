def century(year)
  hsh_ends = { '0' => 'th', '1' => 'st', '2' => 'nd', '3' => 'rd'}

  if year % 100 == 0
    century = year / 100
  else
    century = year / 100 + 1
  end
  string_end = ''
  century_string = century.to_s
  size = century_string.size
  if size > 1 && century_string[size-2] == '1'
    string_end = 'th'
  elsif century_string[size-1].to_i < 4
    string_end = hsh_ends[century_string[size-1]]
  else
    string_end = 'th'
  end
  century_string + string_end
end


p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
