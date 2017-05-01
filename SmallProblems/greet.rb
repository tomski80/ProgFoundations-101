# input : array and hash
#

def greetings(names,details)
  puts "Hello, #{names.join(' ')}! \
Nice to have a #{details[:title]} #{details[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
