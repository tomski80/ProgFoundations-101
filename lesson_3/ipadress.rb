def is_an_ip_number?(number)
  number.to_i.to_s == number
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.size == 4
  result = dot_separated_words.map { |w| is_an_ip_number?(w) }
  !result.include?(false)
end

ip_address = '100.104.11.111'
puts dot_separated_ip_address?(ip_address)
