
def staggered_case(string,argument = 0)
  chars = string.downcase.split('')
  count = argument
  loop do
    chars[count].upcase!
    count += 2
    break if count >= chars.size
  end
  chars.join('')
end



p staggered_case('I Love Launch School!' , 1)
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
