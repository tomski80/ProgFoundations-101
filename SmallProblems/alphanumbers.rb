# input: array of integers between 0 and 19
# return: sorted array based on the English words for each number
# zero one two...



STRING_NUMBERS = %w( zero one two three four five six seven eight
                     nine ten eleven twelve thirteen fourteen fifteen
                     sixteen seventeen eighteen nineteen )


#first iteration
=begin
def alphabetic_number_sort(arr)
  numbers_words = Hash.new
  #build hash of numbers and words
  arr.each_with_index do |num,index|
    numbers_words[num] = STRING_NUMBERS[index]
  end
  numbers_words_arr = numbers_words.to_a
  numbers_words_arr.sort! { |arr1,arr2| arr1[1] <=> arr2[1] }
  numbers_words_arr.map! { |el| el[0] }
end


#second iteration
def alphabetic_number_sort(arr)
  numbers_and_words = []
  arr.each do |num|
    numbers_and_words << [num, STRING_NUMBERS[num]]
  end
  # numbers_and_words.sort_by! { |elem| STRING_NUMBERS[num] }
  # numbers_and_words.map { |elem| elem[0] }
  arr.sort_by! { |elem| STRING_NUMBERS[elem] }
end
=end

#third iteration
def alphabetic_number_sort(arr)
  arr.sort_by { |elem| STRING_NUMBERS[elem] }
end



# example

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
