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
      name_color: :light_green,
      symbol_color: :light_green
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
  },
  Ryuk: {
    name: 'Ryuk',
    colors: {
      name_color: :light_yellow,
      symbol_color: :light_yellow
    },
    difficulty: 2
  },
  Player_456: {
    name: 'Player_456',
    colors: {
      name_color: :light_white,
      symbol_color: :light_white
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
    },
    turn_history: [],
    current_winner: false,
    wins: 0
  },
  player_2: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    },
    turn_history: [],
    current_winner: false,
    wins: 0
  },
  player_3: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    },
    turn_history: [],
    current_winner: false,
    wins: 0
  },
  player_4: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    },
    turn_history: [],
    current_winner: false,
    wins: 0
  },
  player_5: {
    name: '',
    human_or_computer: '',
    symbol_marker: '',
    colors: {
      name_color: '',
      symbol_color: ''
    },
    turn_history: [],
    current_winner: false,
    wins: 0
  }
}

PROMPT = ' => '

def assign_computer_player_data!(player, player_data)
  computer_opponent = choose_computer_opponent(player, player_data).capitalize
  player_data[:available_computer_opponents].delete(computer_opponent)

  player_data[player][:name] = computer_opponent.to_s
  player_data[player][:colors][:name_color] =
    COMPUTER_OPPONENTS[computer_opponent][:colors][:name_color]

  player_data[player][:colors][:symbol_color] =
    COMPUTER_OPPONENTS[computer_opponent][:colors][:symbol_color]

  player_data[player][:symbol_marker] =
    choose_random_symbol_marker(player_data[:available_symbol_markers])

  player_data[:available_symbol_markers].delete(
    SYMBOL_MARKERS_MAP.key(player_data[player][:symbol_marker])
  )
end

def assign_human_player_data!(player, player_data)
  print "What's the name of #{player}?:#{PROMPT}"
  player_data[player][:name] = get_validated_input([])
  player_data[player][:symbol_marker] = choose_symbol_marker!(player_data)
  player_data[:available_symbol_markers].delete(
    player_data[player][:symbol_marker]
  )
  player_colors = choose_player_colors(player)
  player_data[player][:colors][:name_color] = player_colors[0]
  player_data[player][:colors][:symbol_color] = player_colors[1]
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
  valid_board_sizes = (3..20).to_a.map(&:to_s)
  display_board_size_message
  board_size = get_validated_input(valid_board_sizes)
  board_size
end

def choose_computer_opponent(player, player_data)
  computer_opponents_list =
    player_data[:available_computer_opponents].map(&:to_s)

  if randomly_choose_computer_opponent?(player, computer_opponents_list)
    computer_opponent = choose_random_opponent(computer_opponents_list)
  else
    computer_opponent = choose_opponent_manually(computer_opponents_list)
  end
  computer_opponent.to_sym
end

def choose_human_or_computer(player)
  valid_input = %w[h c]

  clear_screen
  puts "Do you want #{player} to be a human or computer player?"
  print "Type 'H' for human or 'C' for computer:#{PROMPT}"
  human_or_computer_choice = get_validated_input(valid_input)
  puts

  human_or_computer_choice.downcase == 'c' ? 'computer' : 'human'
end

def choose_number_of_players
  allowed_number_of_players = %w[2 3 4 5]

  puts 'Choose the total number of players (including computer opponents).'
  puts 'This can be anywhere from 2 to 5 players.'
  puts "It's recommended to choose a number at least 1 smaller than your board size."
  print "How many players? Enter [2, 3, 4, or 5]:#{PROMPT}"
  number_of_players = get_validated_input(allowed_number_of_players)
  puts "#{number_of_players} players will be playing this time!"
  pause_screen
  number_of_players.to_i
end

def choose_opponent_manually(computer_opponents_list)
  
  puts 'You chose to manually pick your opponent.'
  puts 'The computer opponents have different levels of difficulty.'
  puts 'Bobby is the easiest, Maude and Ryuk are medium difficulty,'
  puts 'And Hans and Player_456 are the strongest.'
  puts 'Who do you choose?'
  puts "Your options are: [#{computer_opponents_list.join(', ')}]"
  print "Type in their name exactly as spelled:#{PROMPT}"
  computer_opponent = get_validated_input(computer_opponents_list)
  puts "You picked #{computer_opponent.capitalize}!"
  computer_opponent
end

def choose_player_colors(player)
  available_colors = %w[blue red cyan magenta yellow white]
  puts 'What color do you want your symbol marker to be?'
  puts "Available choices are: [#{available_colors.join(', ')}]"
  print "Enter your choice: #{PROMPT}"
  color_choice = get_validated_input(available_colors)
  puts "You chose #{color_choice} as your name and symbol marker color."
  pause_screen
  [color_choice.to_sym, color_choice.to_sym]
end

def choose_random_opponent(computer_opponents_list)
  puts 'You chose to randomly pick a computer opponent.'
  computer_opponent = computer_opponents_list.sample
  display_thinking_animation('Randomly choosing', 0.3)
  puts "Looks like #{computer_opponent} was chosen!"
  puts
  computer_opponent
end

def choose_random_symbol_marker(available_markers)
  marker = available_markers.sample
  puts "They chose #{marker.capitalize} as their symbol marker!"
  pause_screen
  SYMBOL_MARKERS_MAP[marker]
end

def choose_square_to_mark(board, player)
  valid_squares = board[:parameters][:available_squares].map(&:to_s)
  player_name = player[:name].colorize(player[:colors][:name_color])
  display_board(board)
  puts "Look at the board above and choose a square number."
  print "Which square do you want to mark? #{PROMPT}"
  
  player_square_choice = get_validated_input(valid_squares)
    
  puts "#{player_name} chose to mark square #{player_square_choice}!"
  pause_screen
  
  player_square_choice.to_i
end

def choose_symbol_marker!(player_data)
  available_symbol_markers = player_data[:available_symbol_markers]
  display_symbol_marker_choice_message(available_symbol_markers)
  symbol = get_validated_input(available_symbol_markers)
  player_data[:available_symbol_markers].delete(symbol)

  puts "You chose #{symbol.capitalize} as your symbol marker."
  pause_screen

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

def computer_player_takes_a_turn(board, player)
  available_squares = board[:parameters][:available_squares]
  turn_history = player[:turn_history]
  player_name = player[:name].colorize(player[:colors][:name_color])
  display_board(board)
  square_choice = available_squares.sample
  display_thinking_animation("#{player_name} is thinking", 0.3)
  puts "#{player_name} chose to mark square #{square_choice}!"
  update_turn_history!(turn_history, square_choice)
  update_board!(player, square_choice, board)
  pause_screen
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

# def display_available_squares(available_squares)
#   available_squares.each { |square| print "[#{square}]" }
# end

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

def display_board_size_message
  puts 'Please choose what size of player board you want.'
  puts 'Enter a single number and the board will be a grid of that size.'
  puts 'Example: If you want a 3x3 board, type 3. A 9x9 board, type 9.'
  puts '3x3 is the minimum board size, 20x20 is the max.'
  puts ''
  puts "Enter your board size choice [3 - 20]:#{PROMPT}"
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

def display_symbol_marker_choice_message(available_symbols)
  puts ''
  puts "In this version of the game, you don't have to choose only between being an X or an O."
  puts 'This expanded version lets you choose between the usual X or O, but also a Square, Triangle'
  puts 'or Plus sign shape as your board marker.'
  puts 'Choose from the menu:'
  puts "- 'X' for X marker"
  puts "- 'O' for O marker"
  puts "- 'Square' for a square marker"
  puts "- 'Triangle' for a triangle marker"
  puts "- 'Plus_sign' for a plus sign marker"
  puts 'Some symbols may have already been chosen by another player.'
  puts "The available symbols are:[#{available_symbols.join(', ')}]"
  print "Please enter your choice: #{PROMPT}"
end

def display_thinking_animation(phrase, wait_time)
  print phrase
  5.times do
    print '.'
    sleep wait_time
  end
  puts
  puts
end

def display_tie_game_message
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

def get_validated_input(valid_input)
  user_input = ''
  loop do
    user_input = gets.chomp
    until !user_input.strip.empty? do
      puts "Your input can't be only blank spaces."
      puts  "Please try again: #{PROMPT}"
      user_input = gets.chomp
    end
    
    break if valid_input.any? { |valid_string| valid_string.casecmp?(user_input)} || valid_input.empty?
    # break if valid_input.map(&:downcase).include?(user_input.downcase) || valid_input.empty?
    puts "That's not a valid choice."
    print "Choose one of the following: [#{valid_input.join(', ')}]#{PROMPT}"
  end
  user_input
end

def human_player_takes_a_turn(board, player)
  available_squares = board[:parameters][:available_squares]
  turn_history = player[:turn_history]
  square_choice = choose_square_to_mark(board, player)
  update_turn_history!(turn_history, square_choice)
  update_board!(player, square_choice, board)
end

def initialize_board
  parameters = assign_board_parameters
  layout = create_board_layout(parameters[:total_squares])


  { parameters: parameters, layout: layout, tied_game: false }
end

def pause_screen
  print "Press enter to continue#{PROMPT}"
  gets
end

def play_again?
  
  print "Do you want to play again? #{PROMPT}"
  valid_input = %w[y n]
  choice = get_validated_input()
  choice.downcase == 'y'
end

def play_a_game_round(board, player_data)
  active_players = player_data[:active_players]
  available_squares = board[:parameters][:available_squares]
  clear_screen

  until we_have_a_winner?(active_players, player_data) || tie_game?(available_squares) do
    active_players.each do |player|
      if player_data[player][:human_or_computer] == 'human' 
        human_player_takes_a_turn(board, player_data[player])
      else
        computer_player_takes_a_turn(board, player_data[player])
      end
     
      if current_player_has_won?(player_data[player][:turn_history], board[:parameters][:winning_combos])
        update_player_win_record!(player_data, player)
        break
      elsif tie_game?(available_squares)
        board[:tied_game] = true
        break
      end
    end
  end
end


def current_player_has_won?(move_history, winning_combos)
  
  winning_combos.any? { |combo| (combo.difference(move_history)).empty? }
end

def randomly_choose_computer_opponent?(player, computer_opponents_list)
  puts
  puts "#{player.capitalize} will be a computer opponent."
  puts "Available computer opponents left are [#{computer_opponents_list.join(', ')}]"
  puts
  puts 'Do you want to choose the opponent or have it randomly picked for you?'
  print "Type 'C' to (C)hoose an opponent or 'R' to have it (R)andomly assigned:#{PROMPT}"

  choose_or_random = nil
  loop do
    choose_or_random = gets.chomp
    break if choose_or_random =~ /\A[cr]\z/i
    puts 'Invalid selection. Try again.'
    print "Type 'R' or 'C':#{PROMPT}"
  end
  choose_or_random.downcase == 'r' ? true : false
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
  player_data[:active_players] = default_player_list.take(number_of_players)

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
end

def tie_game?(available_squares)
  available_squares.empty?
end

def update_board!(player, square, board)
  board[:layout][square] =
    player[:symbol_marker].map do |row|
      row.map { |character| character.colorize(player[:colors][:symbol_color]) }
    end
  board[:parameters][:available_squares].delete(square)
end

def update_player_win_record!(player_data, player)
  player_data[player][:wins] += 1
  player_data[player][:current_winner] = true
end

def update_turn_history!(turn_history, turn)
  turn_history << turn
end

def we_have_a_winner?(players, player_data)
  binding.pry
  players.any? { |player| player_data[player][:current_winner] == true}
end

has_seen_welcome_screen = false
loop do
  clear_screen
  display_welcome_message unless has_seen_welcome_screen
  has_seen_welcome_screen = true

  board = initialize_board
  player_data = setup_player_data
  
  play_a_game_round(board, player_data)
  
  congratulate_winner('eddy') if we_have_a_winner?(player_data[:active_players], player_data)
  display_tie_game_message if tie_game?(board[:available_squares])

  break unless play_again?
  # break if winner || tie_game?(board[:parameters][:available_squares])

  #   computer_takes_turn(board, computer_options, computer_turn_history)
  #   display_board(board)
  #   winner = 'Computer' if won?(
  #     computer_turn_history,
  #     board[:parameters][:winning_combos]
  #   )
  #   break if winner || tie_game?(board[:parameters][:available_squares])
  # end

  # winner ? congratulate_winner(winner) : display_tie_game_message
  # break unless play_again?
end

display_goodbye_message
