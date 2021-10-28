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

COMPUTER_OPPONENTS = {
  Bobby: {
    name: 'Bobby',
    colors: {
      name_color: :green,
      symbol_color: :green
    },
    difficulty: 1
  },
  Maude: {
    name: 'Maude',
    colors: {
      name_color: :light_magenta,
      symbol_color: :light_magenta
    },
    difficulty: 2
  },
  Hans: {
    name: 'Hans',
    colors: {
      name_color: :light_cyan,
      symbol_color: :light_cyan
    },
    difficulty: 3
  }
}

X_MARKER = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', 'X', ' ', ' ', ' ', 'X', ' '],
  [' ', ' ', 'X', ' ', 'X', ' ', ' '],
  [' ', ' ', ' ', 'X', ' ', ' ', ' '],
  [' ', ' ', 'X', ' ', 'X', ' ', ' '],
  [' ', 'X', ' ', ' ', ' ', 'X', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

O_MARKER = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', 'O', 'O', 'O', ' ', ' '],
  [' ', 'O', ' ', ' ', ' ', 'O', ' '],
  [' ', 'O', ' ', ' ', ' ', 'O', ' '],
  [' ', 'O', ' ', ' ', ' ', 'O', ' '],
  [' ', ' ', 'O', 'O', 'O', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

TRI_MARKER = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', '∆', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', '∆', ' ', '∆', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', '∆', ' ', '∆', ' ', '∆', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

SQUARE_MARKER = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', '⌂', '⌂', '⌂', '⌂', '⌂', ' '],
  [' ', '⌂', ' ', ' ', ' ', '⌂', ' '],
  [' ', '⌂', ' ', ' ', ' ', '⌂', ' '],
  [' ', '⌂', ' ', ' ', ' ', '⌂', ' '],
  [' ', '⌂', '⌂', '⌂', '⌂', '⌂', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

PLUS_MARKER = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', '+', ' ', ' ', ' '],
  [' ', ' ', '+', '+', '+', ' ', ' '],
  [' ', ' ', ' ', '+', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]

SYMBOL_MARKERS_MAP = {
  'x' => X_MARKER,
  'o' => O_MARKER,
  'triangle' => TRI_MARKER,
  'square' => SQUARE_MARKER,
  'plus_sign' => PLUS_MARKER
}

DEFAULT_PLAYER_DATA = {
  player_1: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    }
  },
  player_2: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    }
  },
  player_3: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    }
  },
  player_4: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    }
  },
  player_5: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    }
  }
}

PROMPT = ' => '

def assign_computer_player_data!(player, player_data)
  available_computer_opponents_strings =
    player_data[:available_computer_opponents].map(&:to_s)

  puts "#{player.capitalize} will be a computer opponent."
  puts 'Do you want to choose the opponent or have it randomly picked for you?'
  puts "Available computer opponents left are [#{available_computer_opponents_strings.join(', ')}:#{PROMPT}"
  print "Type 'C' to (C)hoose an opponent or 'R' to have it (R)andomly assigned:#{PROMPT}"

  choose_or_random = nil
  loop do
    choose_or_random = gets.chomp
    break if choose_or_random =~ /\A[cr]\z/i
    puts 'Invalid selection. Try again.'
    print "Type 'R' or 'C':#{PROMPT}"
  end

  if choose_or_random.upcase == 'R'
    opponent_choice =
      choose_random_opponent(available_computer_opponents_strings)
  else
    opponent_choice =
      choose_opponent_manually(available_computer_opponents_strings)
  end

  opponent_choice = opponent_choice.to_sym
  player_data[:available_computer_opponents].delete(opponent_choice)
  player_data[player][:name] = opponent_choice
  player_data[player][:colors][:name_color] =
    COMPUTER_OPPONENTS[opponent_choice][:colors][:name_color]
  player_data[player][:colors][:symbol_color] =
    COMPUTER_OPPONENTS[opponent_choice][:colors][:symbol_color]
  player_data[player][:symbol_marker] =
    choose_random_symbol_marker(player_data[:available_symbol_markers])
  player_data[:available_symbol_markers].delete(
    SYMBOL_MARKERS_MAP.key(player_data[player][:symbol_marker])
  )
  
end

def assign_human_player_data!(player, player_data)
  print "What's the name of #{player}?:#{PROMPT}"
  player_data[player][:name] = gets.chomp
end

def ask_player_for_symbol_choice
  symbol = nil
  puts ''
  puts "In this version of the game, you don't have to choose only between being an X or an O."
  puts 'This expanded version lets you choose between the usual X or O, but also a Square, Triangle'
  puts 'or Plus sign shape as your board marker.'
  puts 'Choose from the menu:'
  puts "- 'X' or X marker"
  puts "- 'O' for O marker"
  puts "- 'S' for a square marker"
  puts "- 'T' for a triangle marker"
  puts "- 'P' for a plus sign marker"
  print "[X O S T P]#{PROMPT}"
  loop do
    symbol = gets.chomp
    break if symbol =~ /\A[xostp]\z/i
    print "You have to type either X,O,S,T, or P. Try again#{PROMPT}"
  end
  symbol
end

def assign_board_parameters
  parameters = {}
  parameters[:size] = choose_board_size.to_i
  parameters[:colors] = choose_board_colors
  parameters[:winning_combos] =
    determine_winning_square_combos(parameters[:size])
  parameters[:total_squares] = parameters[:size]**2
  parameters[:available_squares] = (1..parameters[:size]**2).to_a
  parameters
end

def calculate_horizontal_winning_combos(board_size)
  winning_combos = []
  first_square = 1
  last_square = first_square + board_size - 1

  until last_square > board_size**2
    winning_combos.push((first_square..last_square).to_a)
    first_square += board_size
    last_square += board_size
  end
  winning_combos
end

def calculate_diagonal_winning_combos(board_size)
  left_to_right_diagonal = ((1..board_size**2).step(board_size + 1)).to_a
  right_to_left_diagonal =
    ((board_size..((board_size**2) - (board_size - 1))).step(board_size - 1))
      .to_a
  [left_to_right_diagonal, right_to_left_diagonal]
end

def calculate_vertical_winning_combos(board_size)
  winning_combos = []
  first_square = 1
  last_square = (board_size**2) - (board_size - 1)

  until last_square > board_size**2
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

  puts 'Please choose what size of player board you want.'
  puts 'Enter a single number and the board will be a grid of that size.'
  puts 'Example: If you want a 3x3 board, type 3. A 9x9 board, type 9.'
  puts '3x3 is the minimum board size, 20x20 is the max.'
  puts ''
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

def choose_human_or_computer(player)
  puts "Do you want #{player} to be a human or computer player?"
  print "Type 'H' for human or 'C' for computer:#{PROMPT}"

  choice = nil
  loop do
    choice = gets.chomp
    break if choice =~ /\A[hc]\z/i
    puts 'Not a valid choice'
    print "Enter either 'H' or 'C':#{PROMPT}"
  end

  choice.downcase == 'c' ? 'computer' : 'human'
end

def choose_number_of_players
  puts 'Choose the total number of players (including computer opponents).'
  puts 'This can be anywhere from 2 to 5 players.'
  puts "It's recommended to choose a number at least 1 smaller than your board size."
  print "How many players? Enter 2, 3, 4, or 5:#{PROMPT}"

  number_of_players = nil
  loop do
    number_of_players = gets.chomp
    break if number_of_players =~ /\A[2345]\z/
    puts "That's not a valid choice."
    print "Enter 2, 3, 4, or 5:#{PROMPT}"
  end
  number_of_players.to_i
end

def choose_player_color
  %i[blue green magenta].sample
end

def choose_opponent_manually(available_opponents)
  puts 'You chose to manually pick your opponent.'
  puts 'The computer opponents have different levels of difficulty.'
  puts 'Bobby is the easiest, Hans is the toughest, and Maude is in the middle.'
  puts 'Who do you choose?'
  puts "Your options are: [#{available_opponents.join(', ')}]"
  print "Type in their name exactly as spelled:#{PROMPT}"

  opponent = nil
  loop do
    opponent = gets.chomp.capitalize
    break if available_opponents.include?(opponent)
    puts 'Not a valid choice. Try again.'
    print "Type one of these choices [#{available_opponents.join(', ')}]"
  end

  puts "You chose #{opponent}!"
  opponent
end

def choose_random_opponent(computer_opponents)
  puts 'You chose to randomly pick a computer opponent.'
  puts "The options are #{computer_opponents.join(', ')}"
  opponent = computer_opponents.sample
  display_thinking_animation('Randomly choosing', 0.2)
  puts "Looks like #{opponent} was chosen!"
  opponent
end

def choose_random_symbol_marker(available_markers)
  marker = available_markers.sample
  puts "Their chosen symbol is the #{marker}!"
  SYMBOL_MARKERS_MAP[marker]
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
  case symbol.upcase
  when 'T'
    return TRI_MARKER
  when 'X'
    return X_MARKER
  when 'P'
    return PLUS_MARKER
  when 'O'
    return O_MARKER
  else
    return SQUARE_MARKER
  end
end

def clear_screen
  system('clear')
end

def computer_takes_turn(board, computer_options, turn_history)
  square_choice = board[:parameters][:available_squares].sample
  display_thinking_animation('The computer is thnking', 0.3)
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

  clear_screen
  number_of_rows.times do
    line_number = 0

    middle_squares_range = ((first_square_in_row + 1)...last_square_in_row)
    until line_number > 6
      temp_line =
        board_grid[first_square_in_row][line_number].join +
          '|'.colorize(:yellow)
      middle_squares_range.each do |square_number|
        temp_line +=
          board_grid[square_number][line_number].join + '|'.colorize(:yellow)
      end
      temp_line += board_grid[last_square_in_row][line_number].join
      print temp_line
      puts
      line_number += 1
    end

    unless last_square_in_row == board[:parameters][:total_squares]
      puts (
             (row_separator * (number_of_squares_per_row - 1)) +
               row_separator_last_square
           )
    end
    first_square_in_row += number_of_squares_per_row
    last_square_in_row += number_of_squares_per_row
  end
end

def display_enter_prompt
  print "Press enter to continue#{PROMPT}"
  gets
end

def display_goodbye_message
  puts 'Thanks for Playing! Goodbye!!'
end

def display_square_choice_prompt(available_squares)
  puts 'Which square do you want to mark?'
  puts ''
  puts 'Enter a number from one of the available square choices left'
  display_available_squares(available_squares)
  print PROMPT
end

def display_thinking_animation(phrase, wait_time)
  print phrase
  5.times do
    print '.'
    sleep wait_time
  end
  puts
end

def display_tie_game
  puts "Looks like it's a tie game! Noone wins, but at least noone lost, eh?"
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

  { parameters: parameters, layout: layout }
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

def set_player_data_defaults
  player_data = DEFAULT_PLAYER_DATA

  player_data[:available_computer_opponents] = COMPUTER_OPPONENTS.keys
  player_data[:available_symbol_markers] = %w[x o triangle square plus_sign]
  player_data[:available_colors] = %i[
    light_red
    yellow
    light_blue
    white
    light_green
  ]
  player_data
end

def setup_player_data
  player_data = set_player_data_defaults
  default_player_list = %i[player_1 player_2 player_3 player_4 player_5]
  number_of_players = choose_number_of_players
  player_data[:active_players] = default_player_list.first(number_of_players)

  player_data[:active_players].each do |player|
    player_data[player][:human_or_computer] = choose_human_or_computer(player)
    if player_data[player][:human_or_computer] == 'computer' &&
         !player_data[:available_computer_opponents].empty?
      assign_computer_player_data!(player, player_data)
    else
      assign_human_player_data!(player, player_data)
    end
  end

  player_data
  # options = {}
  # options[:color] = choose_player_color
  # options[:symbol] = choose_symbol
  # options
end

def tie_game?(available_squares)
  available_squares.empty?
end

def update_board!(options, square, board)
  board[:layout][square] =
    options[:symbol].map do |row|
      row.map { |character| character.colorize(options[:color]) }
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
  # clear_screen
  # display_welcome_message unless has_seen_welcome_screen
  # has_seen_welcome_screen = true

  board = initialize_board
  player_data = setup_player_data
  binding.pry
  computer_options = choose_computer_options
  player_turn_history = []
  computer_turn_history = []
  winner = nil

  display_board(board)

  loop do
    player_takes_turn(board, player_data, player_turn_history)
    display_board(board)
    winner = 'Player' if won?(
      player_turn_history,
      board[:parameters][:winning_combos]
    )
    break if winner || tie_game?(board[:parameters][:available_squares])

    computer_takes_turn(board, computer_options, computer_turn_history)
    display_board(board)
    winner = 'Computer' if won?(
      computer_turn_history,
      board[:parameters][:winning_combos]
    )
    break if winner || tie_game?(board[:parameters][:available_squares])
  end

  winner ? congratulate_winner(winner) : display_tie_game
  break unless play_again?
end

display_goodbye_message
