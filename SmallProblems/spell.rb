require 'pry'
# intput is a word (string more general)
# output is boolean
#
# we need to test each letter
# - if pair letter in the block is also in the word then
#   return false
# - if we go through all letters and pair from each is not in the word
#   then return true

=begin
BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C'=> 'P', 'N' => 'A',
           'G' => 'T', 'R' => 'E', 'F' => 'S', 'J'=> 'W', 'H' => 'U',
           'V' => 'I', 'L' => 'Y', 'Z' => 'M',
           'O' => 'B', 'K' => 'X', 'Q' => 'D', 'P'=> 'C', 'A' => 'N',
           'T' => 'G', 'E' => 'R', 'S' => 'F', 'W'=> 'J', 'U' => 'H',
           'I' => 'V', 'Y' => 'L', 'M' => 'Z' }

def block_word?(word)
  word.upcase.each_char do |char|
    return false if word.include?(BLOCKS[char])
  end
  return true
end
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  up_string = word.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

#examples
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
