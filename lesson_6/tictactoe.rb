EMPTY = 0
MARK_X = 1
MARK_O = 2

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

#random input
def computer_ai_random(board)
  loop do
    row_col = [rand(3), rand(3)]
    break row_col if field_empty?(row_col, board)
  end
end

#defensive ai
def computer_ai_defensive(board)

end
#agressive ai
def computer_ai_aggressive(board)

end

def computer_input(board)
  computer_ai_random(board)
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
  for index in 0...3
    tmp << (board[index][index] == mark)
  end
  win << tmp.all?

  row = 2
  tmp = []
  for col in 0...3
    tmp << (board[row][col] == mark)
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

loop do
  # 0 = empty, 1 = o, 2 = x
  board = [[EMPTY, EMPTY, EMPTY],
           [EMPTY, EMPTY, EMPTY],
           [EMPTY, EMPTY, EMPTY]]
  winner = ''
  player = :player

  loop do
    print_board(board)
    row_col = player_input(board, player)
    update_board(row_col, board, player)

    if winner?(board)
      winner = who_won?(board)
      break
    elsif full?(board)
      winner = 'Tie!'
      break
    end

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
