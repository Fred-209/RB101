# Tic Tac Toe is a game played by two players in which each players alternate turns marking squares on a board with their chosen symbol, either a circle or an X.
# The first player to mark their symbol on three squares that are connected either horizontally, vertically, or diagonally, is the winner. 


# Tic Tac Toe

# 1. Display the initial empty 3x3 board
# 2. Ask the user to choose X or O
# 2. Ask the user to mark a square.
  # - define player_takes_turn() method
  #   - Prompt player to choose either 
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner. 
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Goodbye!

=begin
# Figure out how to draw an X or O using the entire board space instead of a single character 
# - The square grid will be 6 empty spaces across and 3 empty spaces vertical
# - Maybe a nested array could represent the squares
# - Each coordinate in the square will be filled with either a blank space, an X, or an O
# - Those patterns will always be the same, but which one is filling the square can change
# The entire board can be another array who's elements are made up of the 9 square nested arrays
# what an empty square array would look like
[ [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '] ]

# an X representation in a nested array:
X = [ [' ', 'x' ' ' 'x', ' ', ' '], [' ', ' ', 'x', ' ', ' ', ' '], [' ', 'x', ' ', 'x', ' ', ' '] ]



=end


# X = <<-X
#  x x  
#   x  
#  x x  
# X

# O = <<-O
#   oo  
#  o  o 
#   oo  
# O

# def display_board(board)
  # puts ""
  # puts " #{board[1]} #{board[1]}  |      |      "
  # puts "  #{board[1]}   |      |      "
  # puts " #{board[1]} #{board[1]}  |      |      "
  # puts "------+------+------"
  # puts "      |      |      "
  # puts "      |      |      "
  # puts "      |      |      "
  # puts "------+------+------"
  # puts "      |      |      "
  # puts "      |      |      "
  # puts "      |      |      "
  # puts ""
# end

# def initialize_board
#   new_board = {}
#   (1..9).each {|num| new_board[num] = ' '}
#   new_board
# end
# board = initialize_board()

# display_board(board)
# print X
# print O
require 'pry'

X_SQUARE = [ [' ', 'x', ' ', ' ', 'x', ' '],
             [' ', ' ', 'x', 'x', ' ', ' '],
             [' ', ' ', 'x', 'x', ' ', ' '],
             [' ', 'x', ' ', ' ', 'x', ' '] ]

O_SQUARE = [ [' ', ' ', 'o', 'o', ' ', ' '],
             [' ', 'o', ' ', ' ', 'o', ' '],
             [' ', 'o', ' ', ' ', 'o', ' '],
             [' ', ' ', 'o', 'o', ' ', ' '] ]

EMPTY_SQUARE = [ [' ', ' ', ' ', ' ', ' ', ' '],
                 [' ', ' ', ' ', ' ', ' ', ' '],
                 [' ', ' ', ' ', ' ', ' ', ' '],
                 [' ', ' ', ' ', ' ', ' ', ' '] ]    

BOARD_ICON = <<-ICON

   1  |  2  |  3  
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
   4  |  5  |  6  
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ 
   7  |  8  |  9   

ICON

PROMPT = "=> "

def assign_symbols
  player_symbol = player_choose_symbol()

  case player_symbol.downcase
  when 'x'
    return X_SQUARE, O_SQUARE
  else
    return O_SQUARE, X_SQUARE
  end
end

def player_choose_symbol
  symbol = nil
  puts ""
  print "Do you want to be X's or O's?#{PROMPT}"

  loop do
    symbol = gets.chomp
    break if symbol =~ /[xXoO]/
    puts "You have to type either X or O. Try again#{PROMPT}"
  end
  symbol
end

def computer_marks_square(computer_mark)
end

def display_board(board)
  dotted_line = "------+------+------"
  
  puts ""
  puts "#{board[1][0].join}|#{board[2][0].join}|#{board[3][0].join}"
  puts "#{board[1][1].join}|#{board[2][1].join}|#{board[3][1].join}"
  puts "#{board[1][2].join}|#{board[2][2].join}|#{board[3][2].join}"
  puts "#{board[1][3].join}|#{board[2][3].join}|#{board[3][3].join}"
  puts dotted_line
  puts "#{board[4][0].join}|#{board[5][0].join}|#{board[6][0].join}"
  puts "#{board[4][1].join}|#{board[5][1].join}|#{board[6][1].join}"
  puts "#{board[4][2].join}|#{board[5][2].join}|#{board[6][2].join}"
  puts "#{board[4][3].join}|#{board[5][3].join}|#{board[6][3].join}"
  puts dotted_line
  puts "#{board[7][0].join}|#{board[8][0].join}|#{board[9][0].join}"
  puts "#{board[7][1].join}|#{board[8][1].join}|#{board[9][1].join}"
  puts "#{board[7][2].join}|#{board[8][2].join}|#{board[9][2].join}"
  puts "#{board[7][3].join}|#{board[8][3].join}|#{board[9][3].join}"
  puts ""

end

def display_welcome
  puts ""
  puts "Welcome to Tic Tac Toe"
  puts "You are the 'X', the computer is 'O'."
  puts ""
  puts "The squares are labeled as:"
  puts BOARD_ICON
  puts
  puts
end

def initialize_board
  board = {
    1 => EMPTY_SQUARE,
    2 => EMPTY_SQUARE,
    3 => EMPTY_SQUARE,
    4 => EMPTY_SQUARE,
    5 => EMPTY_SQUARE,
    6 => EMPTY_SQUARE,
    7 => EMPTY_SQUARE,
    8 => EMPTY_SQUARE,
    9 => EMPTY_SQUARE
  }

end

def player_takes_turn
  player_turn = nil

  print "#{BOARD_ICON} Which square do you want to mark with X?"
  puts "Enter a square number #{PROMPT}"
  loop do
    player_turn = gets.chomp
    break if player_turn =~ /[1-9]/
    puts "You must enter a number between 1 and 9#{PROMPT}"
  end
  player_turn
end

def update_board(symbol, square, board)
  board[square] = symbol
end

loop do #main loop
  display_welcome()
  player_symbol, computer_symbol = assign_symbols()

  board = initialize_board()
  display_board(board)

  player_turn = player_takes_turn()
  update_board(player_symbol, player_turn.to_i, board)
  p board
  display_board(board)


end