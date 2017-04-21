require 'pry'
# input : string with alphabetic and non-alphabetic characters
# return string with non-alphabetic replaced by spaces (only one space per
# group of characters)
#
# we can iterate through string with each_char method
# and check if character is non-alphabetic and replace with space
# in place

=begin
def cleanup(string)
  string.gsub!(/[^a-zA-Z]/,' ')
  string.squeeze(' ')
end
=end


#loop trough sting
#  store index range from start of non-alphabetic character to first alphabetic
#  replace all character in this index rannge (index_start - index_end) with
#  one space
def cleanup(string)
  letters = %w(a b c d e f g h i j k l m n o p q r s t u w v x y z
     A B C D E F G H I J K L M N O P Q R S T U W V X Y Z )
  index = 0
  loop do
    string[index] = ' ' unless letters.include?(string[index])
    index += 1
    break if index == string.size
  end
  string.squeeze(' ')
end


# example
 p cleanup("---what's my +*& line?") == ' what s my line '
 p cleanup("---what's my+*& line?") == ' what s my line '
 p cleanup("---what's my +*& line?")
 p cleanup("---what's my+*& line?")
