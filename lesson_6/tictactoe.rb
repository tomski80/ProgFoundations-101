EMPTY = 0
MARK_X = 1      # human have x
MARK_O = 2      # computer have o
FIRST = :player

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
    puts "Incorrect input!!! Please enter row and column. (ex. 1C)"
    false
  end
end

def update_board(row_col, board, player)
  if player == :computer
    board[row_col[0]][row_col[1]] = MARK_O
  elsif player == :player
    board[row_col[0]][row_col[1]] = MARK_X
  end
end

# random input
def computer_ai_random(board)
  loop do
    row_col = [rand(3), rand(3)]
    break row_col if field_empty?(row_col, board)
  end
end

def row_full?(board, row_num)
  board[row_num].all? do |field|
    field == EMPTY ? false : true
  end
end

def col_full?(board, col_num)
  tboard = board.transpose
  tboard[col_num].all? do |field|
    field == EMPTY ? false : true
  end
end

def sum_col_marks(board, col_num, mark)
  tboard = board.transpose
  marks_in_col = 0
  tboard[col_num].each do |field|
    marks_in_col += 1 if field == mark
  end
  marks_in_col
end

def sum_row_marks(board, row_num, mark)
  marks_in_row = 0
  board[row_num].each do |field|
    marks_in_row += 1 if field == mark
  end
  marks_in_row
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

def sum_marks_in_not_empty_rows(board, mark)
  two_in_row = []
  board.each_with_index do |_, index|
    unless row_full?(board, index)
      two_in_row[index] = sum_row_marks(board, index, mark)
    end
  end
  two_in_row
end

def sum_marks_in_not_empty_cols(board, mark)
  # check columns
  two_in_col = []
  board.transpose.each_with_index do |_, index|
    unless col_full?(board, index)
      two_in_col[index] = sum_col_marks(board, index, mark)
    end
  end
  two_in_col
end

# defensive ai
def computer_ai_defensive(board)
  row_col = []

  two_in_row = sum_marks_in_not_empty_rows(board, MARK_X)
  two_in_col = sum_marks_in_not_empty_cols(board, MARK_X)

  if two_in_row.find_index(2)
    row_col[0] = two_in_row.find_index(2)
    row_col[1] = find_empty_in_row(board, row_col[0])
  elsif two_in_col.find_index(2)
    row_col[1] = two_in_col.find_index(2)
    row_col[0] = find_empty_in_col(board, row_col[1])
  end
  row_col
end

# agressive ai
def computer_ai_aggressive(board)
  row_col = []

  two_in_row = sum_marks_in_not_empty_rows(board, MARK_O)
  two_in_col = sum_marks_in_not_empty_cols(board, MARK_O)

  if two_in_row.find_index(2)
    row_col[0] = two_in_row.find_index(2)
    row_col[1] = find_empty_in_row(board, row_col[0])
  elsif two_in_col.find_index(2)
    row_col[1] = two_in_col.find_index(2)
    row_col[0] = find_empty_in_col(board, row_col[1])
  end
  row_col
end

def computer_input(board)
  row_col = computer_ai_random(board)
  row_col = [1, 1] if field_empty?([1, 1], board)
  unless computer_ai_defensive(board).none?
    row_col = computer_ai_defensive(board)
  end
  unless computer_ai_aggressive(board).none?
    row_col = computer_ai_aggressive(board)
  end
  row_col
end

def human_input(board)
  row_col = []
  loop do
    user_input = ''
    loop do
      print "Please choose square to mark.Enter row and column. (ex. 2B):"
      user_input = gets.chomp.downcase
      break if correct_input?(user_input)
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

def check_diagonals(board, mark)
  win = []
  tmp = []
  board.each_with_index do |_, index|
    tmp << (board[index][index] == mark)
  end
  win << tmp.all?

  row = 2
  tmp = []
  board.each_with_index do |_, index|
    tmp << (board[row][index] == mark)
    row -= 1
  end
  win << tmp.all?
end

def check_row_col(board, mark)
  win = []
  win << board.map do |row|
    row.all? { |field| field == mark }
  end

  win << board.transpose.map do |col|
    col.all? { |field| field == mark }
  end
  win
end

def winner?(board)
  win = []

  win << check_row_col(board, MARK_X)
  win << check_row_col(board, MARK_O)
  win << check_diagonals(board, MARK_O)
  win << check_diagonals(board, MARK_X)

  if win.flatten.any?
    true
  else
    false
  end
end

def who_won?(board)
  winner = []
  winner << check_row_col(board, MARK_X)
  winner << check_diagonals(board, MARK_X)

  return 'Player' if winner.flatten.any?

  winner = []
  winner << check_row_col(board, MARK_O)
  winner << check_diagonals(board, MARK_O)

  return 'Computer' if winner.flatten.any?

  'Something went wrong!'
end

def full?(board)
  is_full = board.map do |row|
    row.map do |col|
      col == EMPTY ? false : true
    end
  end
  is_full.flatten.all?
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

loop do
  board = [[EMPTY, EMPTY, EMPTY],
           [EMPTY, EMPTY, EMPTY],
           [EMPTY, EMPTY, EMPTY]]
  winner = ''
  player = :player

  player = choose_who_first if FIRST == :choose
  print_board(board) if player == :player

  loop do
    row_col = player_input(board, player)
    update_board(row_col, board, player)

    if winner?(board)
      winner = who_won?(board)
      break
    elsif full?(board)
      winner = 'Tie!'
      break
    end

    print_board(board) if player == :computer
    player = swap_player(player)
  end

  print_board(board)

  if winner == 'Tie!'
    puts "It's a Tie!"
  else
    puts "#{winner} Won the game!"
  end

  puts "Do you want to play again? (y/n)"
  break if gets.chomp == 'n'
end
