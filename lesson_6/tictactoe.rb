EMPTY = 0
MARK_X = 1      # human have x
MARK_O = 2      # computer have o
FIRST = :player

BOARD_SIZE = 3
BOARD_ROW = { '1' => 0, '2' => 1, '3' => 2 }
BOARD_COL = { 'a' => 0, 'b' => 1, 'c' => 2 }

def print_mark(field)
  if field == EMPTY
    print '   '
  elsif field == MARK_X
    print ' x '
  else
    print ' o '
  end
end

def print_board(board)
  puts '  A   B   C '
  board.each_with_index do |row, row_no|
    print(row_no + 1).to_s
    row.each_with_index do |field, index|
      print_mark(field)
      print '|' if index < 2
    end
    puts
    puts ' - - - - - - ' if row_no < 2
  end
  puts
end

def field_empty?(row_col, board)
  board[row_col[0]][row_col[1]] == EMPTY
end

def update_board(row_col, board, player)
  if player == :computer
    board[row_col[0]][row_col[1]] = MARK_O
  elsif player == :player
    board[row_col[0]][row_col[1]] = MARK_X
  end
end

def row_full?(board, row_num)
  board[row_num].count(EMPTY) == 0
end

def col_full?(board, col_num)
  board.transpose[col_num].count(EMPTY) == 0
end

def find_empty_in_row(board, row)
  board[row].each_with_index do |field, index|
    return index if field == EMPTY
  end
end

def find_empty_in_col(board, col)
  board.transpose[col].each_with_index do |field, index|
    return index if field == EMPTY
  end
end

def sum_marks_in_not_full_rows(board, mark)
  two_in_row = []
  board.each_with_index do |_, index|
    unless row_full?(board, index)
      two_in_row[index] = board[index].count(mark)
    end
  end
  two_in_row
end

def sum_marks_in_not_full_cols(board, mark)
  two_in_col = []
  tboard = board.transpose
  tboard.each_with_index do |_, index|
    unless col_full?(board, index)
      two_in_col[index] = tboard[index].count(mark)
    end
  end
  two_in_col
end

def choose_field_next_to_two(mark, board)
  row_col = []

  two_in_row = sum_marks_in_not_full_rows(board, mark)
  two_in_col = sum_marks_in_not_full_cols(board, mark)

  if two_in_row.find_index(2)
    row_col[0] = two_in_row.find_index(2)
    row_col[1] = find_empty_in_row(board, row_col[0])
  elsif two_in_col.find_index(2)
    row_col[1] = two_in_col.find_index(2)
    row_col[0] = find_empty_in_col(board, row_col[1])
  end
  row_col
end

# random choice
def computer_choose_random(board)
  loop do
    row_col = [rand(3), rand(3)]
    break row_col if field_empty?(row_col, board)
  end
end

# defensice choice (protect against lost)
def computer_choose_defensive(board)
  choose_field_next_to_two(MARK_X, board)
end

# agressive choice (go for quick win)
def computer_choose_aggressive(board)
  choose_field_next_to_two(MARK_O, board)
end

# choose row and column to mark
def computer_input(board)
  row_col = computer_choose_random(board)
  row_col = [1, 1] if field_empty?([1, 1], board)
  unless computer_choose_defensive(board).none?
    row_col = computer_choose_defensive(board)
  end
  unless computer_choose_aggressive(board).none?
    row_col = computer_choose_aggressive(board)
  end
  row_col
end

def convert_input(user_input)
  input_arr = user_input.split('')
  input_arr.reject! { |char| char == ' ' }

  if input_arr[0].to_i.to_s == input_arr[0]
    [BOARD_ROW[input_arr[0]], BOARD_COL[input_arr[1]]]
  else
    [BOARD_ROW[input_arr[1]], BOARD_COL[input_arr[0]]]
  end
end

def correct_input?(user_input)
  input_arr = user_input.split('')
  input_arr.reject! { |char| char == ' ' }
  input_arr.sort!

  char_sample = %w[1 2 3 a b c]
  if input_arr.all? { |char| char_sample.include?(char) } &&
     input_arr.size == 2 &&
     (input_arr[1].to_i == 0 && input_arr[0].to_i != 0)
    true
  else
    false
  end
end

def human_input(board)
  row_col = []
  loop do
    user_input = ''
    loop do
      print "Please choose square to mark.Enter row and column. (ex. 2B):"
      user_input = gets.chomp.downcase
      break if correct_input?(user_input)
      puts "Incorrect input!!! Please enter row and column. (ex. 1C)"
    end

    row_col = convert_input(user_input)
    break if field_empty?(row_col, board)
    puts "This field is not empty! Please choose empty field!"
    puts
  end
  row_col
end

def player_input(board, player)
  if player == :player
    human_input(board)
  else
    computer_input(board)
  end
end

def winner_in_diagonals?(board, mark)
  win = []
  tmp = (0...BOARD_SIZE).map do |index|
    board[index][index] == mark
  end
  win << tmp.all?

  row = BOARD_SIZE
  tmp = (0...BOARD_SIZE).map do |index|
    row -= 1
    board[row][index] == mark
  end
  win << tmp.all?
  win.flatten.any?
end

def winner_in_row_col?(board, mark)
  win = []
  win << board.map do |row|
    row.all? { |field| field == mark }
  end

  win << board.transpose.map do |col|
    col.all? { |field| field == mark }
  end
  win.flatten.any?
end

def who_won?(board)
  if winner_in_row_col?(board, MARK_X) || winner_in_diagonals?(board, MARK_X)
    return 'Player'
  end

  if winner_in_row_col?(board, MARK_O) || winner_in_diagonals?(board, MARK_O)
    return 'Computer'
  end
  false
end

def winner?(board)
  !!who_won?(board)
end

def full?(board)
  board.flatten.count(EMPTY) == 0
end

def swap_player(player)
  player == :player ? :computer : :player
end

def choose_who_first
  choice = ''
  loop do
    puts"Hello Player! Who should go first? (c)omputer, (p)layer, or (r)andome?"
    choice = gets.chomp.downcase

    break if %w[c p r].include?(choice)
    puts "Wrong input! Please enter only one letter!"
  end

  case choice
  when 'c'
    :computer
  when 'p'
    :player
  else
    [:player, :computer].sample
  end
end

def initialize_board
  (0...BOARD_SIZE).map do
    (0...BOARD_SIZE).map do
      EMPTY
    end
  end
end

# main loop starts here
loop do
  board = initialize_board
  player = :player

  player = choose_who_first if FIRST == :choose
  print_board(board) if player == :player

  loop do
    row_col = player_input(board, player)
    update_board(row_col, board, player)

    break if winner?(board) || full?(board)

    print_board(board) if player == :computer
    player = swap_player(player)
  end

  print_board(board)

  winner = who_won?(board)
  if winner
    puts "#{winner} won the game!"
  else
    puts "It's a tie!"
  end

  puts "Do you want to play again? (y/n)"
  break if gets.chomp.downcase.chr == 'n'
end
