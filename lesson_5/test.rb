hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key,value|
  value.each do |word|
    vowels = word.chars.select { |vowel| "aeiou".include?(vowel) }
    puts vowels
  end
end
