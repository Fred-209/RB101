# Tic Tac Toe is a game played by two players in which each players alternate turns marking squares on a board with their chosen symbol, either a circle or an X.

# The first player to mark their symbol on three squares that are connected either horizontally, vertically, or diagonally, is the winner.

# Feature - Colorize the board and player/computer symbols
# - Will use the colorize gem
# - Decide on board color 
  #   - yellow
  # - Create constant variable COLORS that contains 
  # - Create choose_player_color method to 

require 'colorize'

def assign_symbols
  player_symbol = choose_symbol

  case player_symbol.downcase
  when 'x'
    return X_SQUARE, O_SQUARE
  else
    return O_SQUARE, X_SQUARE
  end
end

def choose_square_to_mark(available_squares)
  display_square_choice_prompt(available_squares)

  player_square_choice = nil
  loop do
    player_square_choice = gets.chomp
    break if valid_square_choice?(player_square_choice.to_i, available_squares)
    puts 'You must enter a number from one of the available squares.'
    print 'Available choices left are squares '
    display_available_squares(available_squares)
    print PROMPT
  end
  puts "You chose to mark square #{player_square_choice}!"
  display_enter_prompt
  player_square_choice.to_i
end

def choose_symbol
  symbol = nil
  puts ''
  puts "Do you want to be X's or O's?"
  print "Type 'X' for X's or 'O' for O's#{PROMPT}"
  loop do
    symbol = gets.chomp
    break if symbol =~ /\A[xXoO]\z/
    puts "You have to type either X or O. Try again#{PROMPT}"
  end
  puts "You chose to be #{symbol.upcase}'s."
  display_enter_prompt
  symbol
end

def clear_screen
  system('clear')
end

def computer_takes_turn(board, available_squares, symbol, turn_history)
  square_choice = available_squares.sample
  display_thinking_animation
  puts "The computer chose to mark square #{square_choice}!"
  update_turn_history!(turn_history, square_choice)
  update_board!(symbol, square_choice, board, available_squares)
  display_enter_prompt
end

def congratulate_winner(winner)
  if winner == 'Player'
    puts "Congratulations!! You Won! You're the Tic-Tac-Toe Champ!"
  else
    puts "Looks like the computer won this game. Try again and show it who's boss!"
  end
end

def display_available_squares(available_squares)
  available_squares.each { |square| print "[#{square}]" }
end

def display_board(board)
  clear_screen
  puts
  puts 'GAME BOARD'.center(80).colorize(:light_blue)
  puts ''
  dotted_line = '------+------+------'

  puts ''
  display_upper_board_lines(board)
  puts dotted_line.center(80)
  display_middle_board_lines(board)
  puts dotted_line.center(80)
  display_lower_board_lines(board)
  puts ''
end


def display_enter_prompt
  print "Press enter to continue#{PROMPT}"
  gets
end

def display_goodbye_message
  puts 'Thanks for Playing! Goodbye!!'
end

def display_lower_board_lines(board)
  puts "#{board[7][0].join}|#{board[8][0].join}|#{board[9][0].join}".center(80)
  puts "#{board[7][1].join}|#{board[8][1].join}|#{board[9][1].join}".center(80)
  puts "#{board[7][2].join}|#{board[8][2].join}|#{board[9][2].join}".center(80)
  puts "#{board[7][3].join}|#{board[8][3].join}|#{board[9][3].join}".center(80)
end

def display_middle_board_lines(board)
  puts "#{board[4][0].join}|#{board[5][0].join}|#{board[6][0].join}".center(80)
  puts "#{board[4][1].join}|#{board[5][1].join}|#{board[6][1].join}".center(80)
  puts "#{board[4][2].join}|#{board[5][2].join}|#{board[6][2].join}".center(80)
  puts "#{board[4][3].join}|#{board[5][3].join}|#{board[6][3].join}".center(80)
end

def display_square_choice_prompt(available_squares)
  puts "#{BOARD_ICON}Which square do you want to mark?"
  puts ''
  puts 'Enter a number from one of the available square choices left'
  display_available_squares(available_squares)
  print PROMPT
end

def display_thinking_animation
  print 'The computer is thinking'
  5.times do
    print '.'
    sleep 0.6
  end
  puts
end

def display_tie_game
  puts "Looks like it's a tie game! Noone wins, but at least noone lost, eh?"
end

def display_upper_board_lines(board)
  puts "#{board[1][0].join}|#{board[2][0].join}|#{board[3][0].join}".center(80)
  puts "#{board[1][1].join}|#{board[2][1].join}|#{board[3][1].join}".center(80)
  puts "#{board[1][2].join}|#{board[2][2].join}|#{board[3][2].join}".center(80)
  puts "#{board[1][3].join}|#{board[2][3].join}|#{board[3][3].join}".center(80)
end

def display_welcome
  clear_screen
  puts ''
  puts 'Welcome to Tic Tac Toe!'
  puts ''
  puts "This classic game of X's and O's will pit you against a computer opponent."
  puts 'The game board is made up of a 3x3 grid of squares.'
  puts 'In order to choose which square you want, you will type in the number from this handy guide below that corresponds to your square:'
  puts ''
  puts BOARD_ICON
  puts
  puts
end

def initialize_board
  {
    1 => EMPTY_SQUARE,
    2 => EMPTY_SQUARE,
    3 => EMPTY_SQUARE,
    4 => EMPTY_SQUARE,
    5 => EMPTY_SQUARE,
    6 => EMPTY_SQUARE,
    7 => EMPTY_SQUARE,
    8 => EMPTY_SQUARE,
    9 => EMPTY_SQUARE,
  }
end

def play_again?
  choice = nil
  print "Do you want to play again? #{PROMPT}"

  loop do
    choice = gets.chomp
    break if choice =~ /[yn]/i
    puts "You  must choose 'Y' or 'N' #{PROMPT}"
  end
  choice.downcase == 'y'
end

def player_takes_turn(board, available_squares, symbol, turn_history)
  square_choice = choose_square_to_mark(available_squares).to_i
  puts "You chose to mark square #{square_choice}!"
  puts
  update_turn_history!(turn_history, square_choice)
  update_board!(symbol, square_choice, board, available_squares)
end

def tie_game?(available_squares)
  available_squares.empty?
end

def update_board!(symbol, square, board, available_squares)
  board[square] = symbol
  available_squares.delete(square)
end

def update_turn_history!(history, turn)
  history << turn
end

def valid_square_choice?(choice, available_squares)
  available_squares.include?(choice)
end

def have_a_winner?(move_history)
  WINNING_SQUARE_COMBOS.any? { |combo| (combo.difference(move_history)).empty? }
end

X_SQUARE = [
  [' ', 'x', ' ', ' ', 'x', ' '],
  [' ', ' ', 'x', 'x', ' ', ' '],
  [' ', ' ', 'x', 'x', ' ', ' '],
  [' ', 'x', ' ', ' ', 'x', ' '],
]

O_SQUARE = [
  [' ', ' ', 'o', 'o', ' ', ' '],
  [' ', 'o', ' ', ' ', 'o', ' '],
  [' ', 'o', ' ', ' ', 'o', ' '],
  [' ', ' ', 'o', 'o', ' ', ' '],
]

EMPTY_SQUARE = [
  [' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' '],
]

BOARD_ICON = <<-ICON
SQUARES GUIDE

   1  |  2  |  3  
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
   4  |  5  |  6  
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 
   7  |  8  |  9   

ICON

PROMPT = ' => '
WINNING_SQUARE_COMBOS = [
  [1, 2, 3],
  [1, 4, 7],
  [1, 5, 9],
  [2, 5, 8],
  [3, 6, 9],
  [3, 5, 7],
  [4, 5, 6],
  [7, 8, 9],
]

has_seen_welcome_screen = false
loop do
  board = initialize_board
  available_squares = board.keys
  player_turn_history = []
  computer_turn_history = []
  winner = nil

  clear_screen
  display_welcome unless has_seen_welcome_screen
  has_seen_welcome_screen = true
  player_symbol, computer_symbol = assign_symbols

  display_board(board)

  loop do
    player_takes_turn(
      board,
      available_squares,
      player_symbol,
      player_turn_history,
    )
    display_board(board)
    winner = 'Player' if have_a_winner?(player_turn_history)
    break if winner || tie_game?(available_squares)

    computer_takes_turn(
      board,
      available_squares,
      computer_symbol,
      computer_turn_history,
    )
    display_board(board)
    winner = 'Computer' if have_a_winner?(computer_turn_history)
    break if winner || tie_game?(available_squares)
  end

  winner ? congratulate_winner(winner) : display_tie_game
  break unless play_again?
end

display_goodbye_message
