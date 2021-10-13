# Tic Tac Toe is a game played by two players in which each players alternate turns marking squares on a board with their chosen symbol, either a circle or an X.
# The first player to mark their symbol on three squares that are connected either horizontally, vertically, or diagonally, is the winner. 


# Tic Tac Toe

# 1. Display the initial empty 3x3 board
# 2. Ask the user to mark a square.
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

board = {
  sq1: EMPTY_SQUARE,
  sq2: EMPTY_SQUARE,
  sq3: EMPTY_SQUARE,
  sq4: EMPTY_SQUARE,
  sq5: EMPTY_SQUARE,
  sq6: EMPTY_SQUARE,
  sq7: EMPTY_SQUARE,
  sq8: EMPTY_SQUARE,
  sq9: EMPTY_SQUARE
}

def display_board(board)
  dotted_line = "------+------+------"
  
  puts ""
  puts "#{board[:sq1][0].join}|#{board[:sq2][0].join}|#{board[:sq3][0].join}"
  puts "#{board[:sq1][1].join}|#{board[:sq2][1].join}|#{board[:sq3][1].join}"
  puts "#{board[:sq1][2].join}|#{board[:sq2][2].join}|#{board[:sq3][2].join}"
  puts "#{board[:sq1][3].join}|#{board[:sq2][3].join}|#{board[:sq3][3].join}"
  puts dotted_line
  puts "#{board[:sq4][0].join}|#{board[:sq5][0].join}|#{board[:sq6][0].join}"
  puts "#{board[:sq4][1].join}|#{board[:sq5][1].join}|#{board[:sq6][1].join}"
  puts "#{board[:sq4][2].join}|#{board[:sq5][2].join}|#{board[:sq6][2].join}"
  puts "#{board[:sq4][3].join}|#{board[:sq5][3].join}|#{board[:sq6][3].join}"
  puts dotted_line
  puts "#{board[:sq7][0].join}|#{board[:sq8][0].join}|#{board[:sq9][0].join}"
  puts "#{board[:sq7][1].join}|#{board[:sq8][1].join}|#{board[:sq9][1].join}"
  puts "#{board[:sq7][2].join}|#{board[:sq8][2].join}|#{board[:sq9][2].join}"
  puts "#{board[:sq7][3].join}|#{board[:sq8][3].join}|#{board[:sq9][3].join}"
  puts ""

end

loop do #main loop
  display_board(board)
end