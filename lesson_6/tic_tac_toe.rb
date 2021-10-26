# Tic Tac Toe is a game played by two players in which each players alternate
# turns marking squares on a board with their chosen symbol, either a circle
# or an X.

# The first player to mark their symbol on three squares that are connected
# either
# horizontally, vertically, or diagonally, is the winner.

# Feature - Colorize the board and player/computer symbols
# - Will use the colorize gem

# - Decide on board color
#   - yellow
# - Create constant variable COLORS that contains
# - Create choose_player_color method to

require 'colorize'
require 'pry'

X_SQUARE = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', 'X', ' ', ' ', ' ', 'X', ' '],
  [' ', ' ', 'X', ' ', 'X', ' ', ' '],
  [' ', ' ', ' ', 'X', ' ', ' ', ' '],
  [' ', ' ', 'X', ' ', 'X', ' ', ' '],
  [' ', 'X', ' ', ' ', ' ', 'X', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

O_SQUARE = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', 'O', 'O', 'O', ' ', ' '],
  [' ', 'O', ' ', ' ', ' ', 'O', ' '],
  [' ', 'O', ' ', ' ', ' ', 'O', ' '],
  [' ', 'O', ' ', ' ', ' ', 'O', ' '],
  [' ', ' ', 'O', 'O', 'O', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

PROMPT = ' => '

def ask_player_for_symbol_choice
  symbol = nil
  puts ''
  puts "Do you want to be X's or O's?"
  print "Type 'X' for X's or 'O' for O's#{PROMPT}"
  loop do
    symbol = gets.chomp
    break if symbol =~ /\A[xXoO]\z/
    puts "You have to type either X or O. Try again#{PROMPT}"
  end
  symbol
end

def assign_board_parameters
  parameters = {}
  parameters[:size] = choose_board_size.to_i
  parameters[:colors] = choose_board_colors
  parameters[:winning_combos] = determine_winning_square_combos(parameters[:size])
  parameters[:total_squares] = parameters[:size] ** 2
  parameters[:available_squares] = (1..parameters[:size] ** 2).to_a
  parameters
end

def assign_symbols
  player_symbol = choose_symbol

  case player_symbol.downcase
  when 'x'
    return X_SQUARE, O_SQUARE
  else
    return O_SQUARE, X_SQUARE
  end
end

def calculate_horizontal_winning_combos(board_size)
  winning_combos = []
  first_square = 1
  last_square = first_square + board_size - 1

  until last_square > board_size**2 do
    winning_combos.push((first_square..last_square).to_a)
    first_square += board_size
    last_square += board_size
  end
  winning_combos 
end

def calculate_diagonal_winning_combos(board_size)
  left_to_right_diagonal = ((1..board_size ** 2).step(board_size + 1)).to_a
  right_to_left_diagonal = ((board_size..((board_size ** 2) - (board_size - 1))).step(board_size - 1)).to_a
  [left_to_right_diagonal, right_to_left_diagonal]
end

def calculate_vertical_winning_combos(board_size)
  winning_combos = []
  first_square = 1
  last_square = (board_size ** 2) - (board_size -1)

  until last_square > board_size ** 2 do 
    winning_combos.push(((first_square..last_square).step(board_size)).to_a)
    first_square += 1
    last_square += 1
  end
  winning_combos
end

def choose_board_colors
  'red'
end

def choose_board_size
  board_size = nil

  puts "Please choose what size of player board you want."
  puts "Enter a single number and the board will be a grid of that size."
  puts "Example: If you want a 3x3 board, type 3. A 9x9 board, type 9."
  puts "3x3 is the minimum board size, 20x20 is the max."
  puts ""
  puts "Enter your board size choice [3 - 20]:#{PROMPT}"
  loop do
    board_size = gets.chomp
    break if (3..20).include?(board_size.to_i)
    puts "That's not a valid board size."
    print "Please enter a number between 3 and 20:#{PROMPT}"
  end

board_size
end

def choose_computer_options
  options = {}
  options[:color] = :cyan
  options[:symbol] = choose_symbol
  options
end

def choose_player_color
  [:blue, :green, :magenta].sample
end

def choose_player_options
  options = {}
  options[:color] = choose_player_color
  options[:symbol] = choose_symbol
  options
end

def choose_square_to_mark(available_squares)
  display_square_choice_prompt(available_squares)

  player_square_choice = nil
  loop do
    player_square_choice = gets.chomp
    break if available_squares.include?(player_square_choice.to_i)
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
  symbol = ask_player_for_symbol_choice
  puts "You chose to be #{symbol.upcase}'s."
  display_enter_prompt
  symbol == 'x' ? X_SQUARE : O_SQUARE
end

def clear_screen
  system('clear')
end

def computer_takes_turn(board,computer_options, turn_history)
  square_choice = board[:parameters][:available_squares].sample
  display_thinking_animation
  puts "The computer chose to mark square #{square_choice}!"
  update_turn_history!(turn_history, square_choice)
  update_board!(computer_options, square_choice, board)
  display_enter_prompt
end

def congratulate_winner(winner)
  if winner == 'Player'
    puts "Congratulations!! You Won! You're the Tic-Tac-Toe Champ!"
  else
    puts 'Looks like the computer won this game. Try again and show'
    " it who's boss!"
  end
end

def create_board_layout(total_number_of_squares)
  empty_board_layout =
    (1..total_number_of_squares).each_with_object({}) do |square, square_grid|
      square_grid[square] = []
      7.times do
        if square < 10
          square_grid[square].push([' ', ' ', ' ', ' ', ' ', ' ', ' '])
        elsif square < 100
          square_grid[square].push([' ', ' ', ' ', '  ', ' ', ' '])
        else
          square_grid[square].push([' ', ' ', ' ', '   ', ' '])
        end
      end
    end
     
  labeled_board_layout = empty_board_layout.dup
  empty_board_layout.each_key do |square|
    labeled_board_layout[square][3][3] = square
  end
  labeled_board_layout
end

def determine_winning_square_combos(board_size)
  horizontal_combos = calculate_horizontal_winning_combos(board_size)
  vertical_combos = calculate_vertical_winning_combos(board_size)
  diagonal_combos = calculate_diagonal_winning_combos(board_size)
    
  horizontal_combos + vertical_combos + diagonal_combos
end


def display_available_squares(available_squares)
  available_squares.each { |square| print "[#{square}]" }
end

def display_board(board)
  board_grid = board[:layout]
  number_of_rows = board[:parameters][:size]
  row_separator = '-------'.colorize(:yellow) + '+'.colorize(:red)
  row_separator_last_square = '-------'.colorize(:yellow)
  number_of_squares_per_row = board[:parameters][:size]
  
  first_square_in_row = 1
  last_square_in_row = board[:parameters][:size]
  
  
  number_of_rows.times do 
    line_number = 0
    
    middle_squares_range = ((first_square_in_row + 1)...last_square_in_row)

    until line_number > 6
      temp_line = board_grid[first_square_in_row][line_number].join + '|'.colorize(:yellow)
      middle_squares_range.each do |square_number|
      temp_line += board_grid[square_number][line_number].join + '|'.colorize(:yellow)
    end
      temp_line += board_grid[last_square_in_row][line_number].join
      print temp_line
      puts
      line_number += 1
    end

    puts ((row_separator * (number_of_squares_per_row - 1)) + row_separator_last_square) unless last_square_in_row == board[:parameters][:total_squares]
    first_square_in_row += number_of_squares_per_row
    last_square_in_row += number_of_squares_per_row

  end
   

    
  
  gets
end

  # clear_screen
  # board_grid.each_pair do |row|
  #   puts row
  # end

  # clear_screen
  # puts
  # puts 'GAME BOARD'.center(80).colorize(:light_blue)
  # puts ''
  # dotted_line = '-------'
  # puts ''
  # display_upper_board_lines(board)
  # puts dotted_line.center(80)
  # display_middle_board_lines(board)
  # puts dotted_line.center(80)
  # display_lower_board_lines(board)
  # puts ''


def display_enter_prompt
  print "Press enter to continue#{PROMPT}"
  gets
end

def display_goodbye_message
  puts 'Thanks for Playing! Goodbye!!'
end

def display_lower_board_lines(board)
  puts "#{board[:layout][7][0].join}|#{board[:layout][8][0].join}|#{board[:layout][9][0].join}".center(80)
  puts "#{board[:layout][7][1].join}|#{board[:layout][8][1].join}|#{board[:layout][9][1].join}".center(80)
  puts "#{board[:layout][7][2].join}|#{board[:layout][8][2].join}|#{board[:layout][9][2].join}".center(80)
  puts "#{board[:layout][7][3].join}|#{board[:layout][8][3].join}|#{board[:layout][9][3].join}".center(80)
end

def display_middle_board_lines(board)
  puts "#{board[:layout][4][0].join}|#{board[:layout][5][0].join}|#{board[:layout][6][0].join}".center(80)
  puts "#{board[:layout][4][1].join}|#{board[:layout][5][1].join}|#{board[:layout][6][1].join}".center(80)
  puts "#{board[:layout][4][2].join}|#{board[:layout][5][2].join}|#{board[:layout][6][2].join}".center(80)
  puts "#{board[:layout][4][3].join}|#{board[:layout][5][3].join}|#{board[:layout][6][3].join}".center(80)
end

def display_square_choice_prompt(available_squares)
  puts "Which square do you want to mark?"
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
  puts "#{board[:layout][1][0].join}|#{board[:layout][2][0].join}|#{board[:layout][3][0].join}".center(80)
  puts "#{board[:layout][1][1].join}|#{board[:layout][2][1].join}|#{board[:layout][3][1].join}".center(80)
  puts "#{board[:layout][1][2].join}|#{board[:layout][2][2].join}|#{board[:layout][3][2].join}".center(80)
  puts "#{board[:layout][1][3].join}|#{board[:layout][2][3].join}|#{board[:layout][3][3].join}".center(80)
end

def display_welcome_message
  clear_screen
  puts ''
  puts 'Welcome to Tic Tac Toe!'
  puts ''
  puts "This classic game of X's and O's will pit you against a computer " \
         'opponent.'
  puts 'The game board is made up of a 3x3 grid of squares.'
  puts 'In order to choose which square you want, you will type in the ' \
         'number from this handy guide below that corresponds to your square:'
  puts ''
  puts
  puts
end

def initialize_board
  parameters = assign_board_parameters
  layout = create_board_layout(parameters[:total_squares])

  {:parameters => parameters, :layout => layout}
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

def player_takes_turn(board, player_options, turn_history)
  square_choice = choose_square_to_mark(board[:parameters][:available_squares])
  puts "You chose to mark square #{square_choice}!"
  puts
  update_turn_history!(turn_history, square_choice)
  update_board!(player_options, square_choice, board)
end

def tie_game?(available_squares)
  available_squares.empty?
end

def update_board!(options, square, board)
  p options
  p options[:symbol]
  gets
  board[:layout][square] = options[:symbol].map do |row|
    row.map do |character|
      character.colorize(options[:color])
    end
  end
  board[:parameters][:available_squares].delete(square)
end

def update_turn_history!(history, turn)
  history << turn
end

def won?(move_history, winning_combos)
  winning_combos.any? { |combo| (combo.difference(move_history)).empty? }
end

has_seen_welcome_screen = false
loop do
  clear_screen
  display_welcome_message unless has_seen_welcome_screen
  has_seen_welcome_screen = true

  board = initialize_board
  player_options = choose_player_options
  computer_options = choose_computer_options
  player_turn_history = []
  computer_turn_history = []
  winner = nil

  
  display_board(board)

  loop do
    player_takes_turn(
      board,
      player_options,
      player_turn_history
    )
    display_board(board)
    winner = 'Player' if won?(player_turn_history, board[:parameters][:winning_combos])
    break if winner || tie_game?(board[:parameters][:available_squares])

    computer_takes_turn(
      board,
      computer_options,
      computer_turn_history
    )
    display_board(board)
    winner = 'Computer' if won?(computer_turn_history, board[:parameters][:winning_combos])
    break if winner || tie_game?(board[:parameters][:available_squares])
  end

  winner ? congratulate_winner(winner) : display_tie_game
  break unless play_again?
end

display_goodbye_message
