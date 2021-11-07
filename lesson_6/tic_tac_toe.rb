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
    difficulty: 2
  },
  Ryuk: {
    name: 'Ryuk',
    colors: {
      name_color: :light_yellow,
      symbol_color: :light_yellow
    },
    difficulty: 3
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

TRIANGLE_MARKER = [
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
  'triangle' => TRIANGLE_MARKER,
  'square' => SQUARE_MARKER,
  'plus_sign' => PLUS_MARKER
}

PROMPT = ' => '

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
  player_colors = choose_player_colors(player_data[player][:name])
  player_data[player][:colors][:name_color] = player_colors[0]
  player_data[player][:colors][:symbol_color] = player_colors[1]
end

def calculate_horizontal_winning_combos(board_size)
  winning_combos = []
  first_square = 1
  # last_square = first_square + board_size - 1
  last_square = board_size

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

def check_for_winner_or_tie(board, current_player_slot, player_data)

  if current_player_has_won?(
    player_data[current_player_slot][:turn_history],
    board[:parameters][:winning_combos]
  )
    set_round_winner!(board, current_player_slot, player_data)
    increment_player_round_wins!(player_data, current_player_slot)
    
    
  elsif tie_game?(player_data[:active_players], player_data)
    board[:tied_game] = true
    
  end

end


def choose_closest_completed_combo(current_player_slot, player_data)
  viable_combos = player_data[current_player_slot][:winning_combos_still_viable]
  closest_completed_combo = viable_combos.min_by { |combo| combo.size }
end

def choose_board_colors
  'red'
end

def choose_board_size
  valid_board_sizes = (3..10).to_a.map(&:to_s)
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
    computer_opponent =
      choose_computer_opponent_manually(computer_opponents_list)
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

def choose_computer_opponent_manually(computer_opponents_list)
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

def choose_level_1_ai_square(board)
  random_square_choice(board[:parameters][:available_squares])
end

def choose_level_2_ai_square(board, player_slot, player_data)
  intelligence_score = rand(11)
  random_available_square = board[:parameters][:available_squares].sample

  if intelligence_score > 7
    winning_square = get_other_players_winning_squares_if_exist(board, player_slot, player_data)
  end

  winning_square ? winning_square : random_available_square
end

def choose_level_3_ai_square(board, player_slot, player_data)
  available_squares = board[:parameters][:available_squares]
  turn_history = player_data[player_slot][:turn_history]

  return random_square_choice(available_squares) if turn_history.empty?

  closest_winning_combo = choose_closest_completed_combo(player_slot, player_data)
  number_of_squares_to_win = 
    closest_winning_combo ? closest_winning_combo.size : 0
  
  if number_of_squares_to_win == 1
    winning_square = closest_winning_combo.first
  else
    winning_square = get_other_players_winning_squares_if_exist(board, player_slot, player_data)
  end

  return winning_square if winning_square

  if closest_winning_combo
    random_square_choice(closest_winning_combo)
  else
    random_square_choice(available_squares)
  end
end

def choose_player_colors(player_name)
  available_colors = %w[blue red cyan magenta yellow white]
  puts 'What color do you want your symbol marker to be?'
  puts "Available choices are: [#{available_colors.join(', ')}]"
  print "Enter your choice: #{PROMPT}"
  color_choice = get_validated_input(available_colors)
  puts "#{player_name} chose #{color_choice} as their name and symbol marker color."
  pause_screen
  [color_choice.to_sym, color_choice.to_sym]
end

def choose_player_turn_order!(player_data)
  active_players = player_data[:active_players]
  
  turn_order_selection = get_turn_order_selection(active_players, player_data)
  player_data[:active_players] = turn_order_selection
  print "The turn order will be "

  turn_order_selection.each do |player|
    print "#{player_data[player][:name].colorize(player_data[player][:colors][:name_color])} "
  end
  puts ''
  gets
end


def choose_who_goes_first(active_players, player_data)
  number_of_players = active_players.size
  active_players.each_with_index do |player, idx|
    puts "#{idx +1}. #{player_data[player][:name]}"
  end

  puts "Choose [#{(1...number_of_players).to_a.join(', ')} or #{number_of_players}]: #{PROMPT}"
  user_pick = get_validated_input((1..number_of_players).to_a.map(&:to_s))
  active_players[user_pick.to_i - 1]
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

def choose_symbol_marker!(player_data)
  available_symbol_markers = player_data[:available_symbol_markers]
  display_symbol_marker_choice_message(available_symbol_markers)
  symbol = get_validated_input(available_symbol_markers)
  player_data[:available_symbol_markers].delete(symbol)

  puts "You chose #{symbol.capitalize} as your symbol marker."
  pause_screen

  case symbol
  when 'triangle'
    TRIANGLE_MARKER
  when 'x'
    X_MARKER
  when 'plus_sign'
    PLUS_MARKER
  when 'o'
    O_MARKER
  when 'square'
    SQUARE_MARKER
  end
end

def clear_screen
  system('clear')
end

def computer_player_chooses_square(board, player_slot, player, player_data)
  ai_difficulty_level = COMPUTER_OPPONENTS[player[:name].to_sym][:difficulty]

  square_choice =
    case ai_difficulty_level
    when 1
      choose_level_1_ai_square(board)
    when 2
      choose_level_2_ai_square(board, player_slot, player_data)
    when 3
      choose_level_3_ai_square(board, player_slot, player_data)
    end

  square_choice
end

def computer_player_takes_a_turn(board, player_slot, player_data)
  player = player_data[player_slot]
  turn_history = player[:turn_history]
  player_name = player[:name].colorize(player[:colors][:name_color])

  square_choice =
    computer_player_chooses_square(board, player_slot, player, player_data)
  update_turn_history!(turn_history, square_choice)
  update_board!(player, square_choice, board)
  update_squares_list_in_viable_combos!(player_slot, player_data, square_choice)
  display_thinking_animation("#{player_name} is thinking", 0.1)
  display_board(board)
  puts "#{player_name} chose to mark square #{square_choice}!"
  pause_screen
end

def congratulate_winner(winner, player_data)
  player_name = player_data[winner][:name]
  player_color = player_data[winner][:colors][:name_color]

  puts "Congratulations #{player_name.colorize(player_color)}!"
  puts 'You won this round!'
end

def create_board_layout(total_number_of_squares)
  empty_board_layout =
    (1..total_number_of_squares).each_with_object({}) do |square, square_grid|
      square_grid[square] = []

      # 1 digit, 2, digit, and 3 digit square numbers effect the terminal
      # screen layout differently
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

def current_player_has_won?(turn_history, winning_combos)
  winning_combos.any? { |combo| (combo.difference(turn_history)).empty? }
end



def determine_winning_square_combos(board_size)
  horizontal_combos = calculate_horizontal_winning_combos(board_size)
  vertical_combos = calculate_vertical_winning_combos(board_size)
  diagonal_combos = calculate_diagonal_winning_combos(board_size)

  horizontal_combos + vertical_combos + diagonal_combos
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
  puts "In this version of the game, you don't have to choose only between"
  puts 'being an X or an O.'
  puts 'This expanded version lets you choose between the usual X or O,'
  puts 'but also a Square, Triangle'
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
  puts "It looks like either there are no empty squares to pick from on the"
  puts "board, or it's impossible for anyone to win now because there are"
  puts "no more winning combinations left for anyone."
  puts "TIE GAME!!"
  puts ""
end

def display_turn_order_choices
  puts "Do you want to keep the default turn order, or change it?"
  puts "Make your choice from the menu below:"
  puts "1. Keep the default turn order."
  puts "2. Shuffle the turn order randomly."
  puts "3. Choose who goes first."
  print "Which do you choose [1, 2, or 3]?:#{PROMPT}"
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

def get_other_players_winning_squares_if_exist(board, player_slot, player_data)
  current_player_name = player_data[player_slot][:name]
  winning_combos = board[:parameters][:winning_combos]
  available_squares = board[:parameters][:available_squares]
  active_players = player_data[:active_players]

  winning_combos.each do |combo|
    active_players.each do |player|
      next if player_data[player][:name] == current_player_name
      squares_to_win = combo.difference(player_data[player][:turn_history])
      if squares_to_win.size == 1 &&
           available_squares.include?(squares_to_win[0])
        return squares_to_win.first
      end
    end
  end
  nil
end

def get_turn_order_selection(active_players, player_data)
  display_turn_order_choices
  turn_order_menu_choice = get_validated_input(%w[1 2 3])
  turn_order = case turn_order_menu_choice
               when '1'
                 active_players
               when '2' 
                 active_players.shuffle
               when '3'
                 first_player = choose_who_goes_first(active_players, player_data)
                 other_players = active_players - [first_player]
                 [first_player] + other_players
               end 
  turn_order
end

def get_validated_input(valid_input)
  user_input = ''
  loop do
    user_input = gets.chomp
    until !user_input.strip.empty?
      puts "Your input can't be only blank spaces."
      puts "Please try again: #{PROMPT}"
      user_input = gets.chomp
    end

    if valid_input.any? { |valid_string| valid_string.casecmp?(user_input) } ||
         valid_input.empty?
      break
    end

    puts "That's not a valid choice."
    print "Choose one of the following: [#{valid_input.join(', ')}]#{PROMPT}"
  end
  user_input
end

def human_player_chooses_square(board, player_name)
  valid_squares = board[:parameters][:available_squares].map(&:to_s)

  display_board(board)
  puts 'Look at the board above and choose a square number.'
  print "Which square do you want to mark, #{player_name}? #{PROMPT}"

  get_validated_input(valid_squares).to_i
end

def human_player_takes_a_turn(board, player_slot, player_data)
  player = player_data[player_slot]
  available_squares = board[:parameters][:available_squares]
  player_name = player[:name].colorize(player[:colors][:name_color])
  turn_history = player[:turn_history]
  square_choice = human_player_chooses_square(board, player_name)

  update_turn_history!(turn_history, square_choice)
  update_board!(player, square_choice, board)
  update_squares_list_in_viable_combos!(player_slot, player_data, square_choice)
  clear_screen
  display_board(board)
  puts "#{player_name} chose to mark square #{square_choice}!"
  pause_screen
end

def increment_player_game_wins!(player_slot, player_data)
  player_data[player_slot][:game_wins] += 1
end


def increment_player_round_wins!(player_data, player)
  player_data[player][:round_wins] += 1
end

def pause_screen
  print "Press enter to continue#{PROMPT}"
  gets
end



def play_again?
  print "Do you want to play again? #{PROMPT}"
  valid_input = %w[y n]
  choice = get_validated_input(valid_input)
  choice.downcase == 'y'
end

def play_best_of_five(board, player_data)
  active_players = player_data[:active_players]

  until board[:game_winner]

    until board[:round_winner] || board[:tied_game]
      active_players.each do |current_player_slot|
        take_a_turn(board, current_player_slot, player_data)
        check_for_winner_or_tie(board, current_player_slot, player_data)
        break if board[:round_winner] || board[:tied_game]
      end
    end
    round_winner = board[:round_winner]
    puts "#{player_data[round_winner][:name]} won this round"
    active_players.each {|player| puts "#{player_data[player][:name]}: #{player_data[player][:round_wins]}"}
    
    
    if player_data[round_winner][:round_wins] >= 5
      set_game_winner!(board, round_winner)
    end
    board[:round_winner] = nil
  end

  puts 'You won 5 games!'
  gets
  increment_player_game_wins!(board[:game_winner], player_data)
  
end

def play_single_game(board, player_data)
  active_players = player_data[:active_players]
  # available_squares = board[:parameters][:available_squares]
  
  clear_screen
  until board[:round_winner] || board[:tied_game]
        
    active_players.each do |current_player_slot|
      take_a_turn(board, current_player_slot, player_data)
      check_for_winner_or_tie(board, current_player_slot, player_data)
      break if board[:round_winner] || board[:tied_game]
    end
  end

  return if board[:tied_game]
  set_game_winner!(board, board[:round_winner])
  increment_player_game_wins!(board[:game_winner], player_data)
  
end

def randomly_choose_computer_opponent?(player, computer_opponents_list)
  puts
  puts "#{player.capitalize} will be a computer opponent."
  puts "Available computer opponents left are [#{computer_opponents_list.join(', ')}]"
  puts
  puts 'Do you want to choose the opponent or have it randomly picked for you?'
  print "Type 'C' to (C)hoose an opponent or 'R' to have it (R)andomly assigned"
  print ":#{PROMPT}"

  choose_or_random = nil
  loop do
    choose_or_random = gets.chomp
    break if choose_or_random =~ /\A[cr]\z/i
    puts 'Invalid selection. Try again.'
    print "Type 'R' or 'C':#{PROMPT}"
  end
  choose_or_random.downcase == 'r'
end

def random_square_choice(available_squares)
  available_squares.sample
end

def remove_unviable_square_combos!(
  all_active_players,
  player_data
)
  
  
  all_active_players.each do |player_slot|
    viable_square_combos = player_data[player_slot][:winning_combos_still_viable]
    other_players =
      player_data[:active_players].reject do |other_player_slot|
        other_player_slot == player_slot
      end
    other_players.each do |other_player|
      turn_history = player_data[other_player][:turn_history]
      viable_square_combos.clone.each do |combo|
        viable_square_combos.delete(combo) if !(combo & turn_history).empty?
      end
    end
  end  
end

def set_player_data_defaults(player_list, winning_combos)
  player_data =
    player_list.to_h do |player|
      [
        player,
        {
          name: '',
          human_or_computer: '',
          symbol_marker: '',
          colors: {
            name_color: '',
            symbol_color: ''
          },
          turn_history: [],
          round_wins: 0,
          game_wins: 0,
          winning_combos_still_viable:
            Marshal.load(Marshal.dump(winning_combos))
        }
      ]
    end

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

def set_round_winner!(board, player_slot, player_data)
  board[:round_winner] = player_slot
  # player_data[player_slot][:curent_winner] = true
end

def set_game_winner!(board, player_slot)
  board[:game_winner] = player_slot
end

def setup_board
  parameters = assign_board_parameters
  layout = create_board_layout(parameters[:total_squares])
  
  {
    parameters: parameters,
    layout: layout,
    round_winner: nil,
    game_winner: nil,
    tied_game: false,
    best_of_five: false
  }
end

def setup_player_data(board)
  default_player_list = %i[player_1 player_2 player_3 player_4 player_5]
  player_data =
    set_player_data_defaults(
      default_player_list,
      board[:parameters][:winning_combos]
    )
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

def take_a_turn(board, current_player_slot, player_data)
  if player_data[current_player_slot][:human_or_computer] == 'human'
    human_player_takes_a_turn(
      board,
      current_player_slot,
      player_data
    )
  else
    computer_player_takes_a_turn(
      board,
      current_player_slot,
      player_data
    )
  end
  remove_unviable_square_combos!(player_data[:active_players], player_data)
end


def tie_game?(players, player_data)
  number_of_players_that_can_still_win = players.size

  players.each do |player|
    if player_data[player][:winning_combos_still_viable].empty?
      number_of_players_that_can_still_win -= 1
    end
  end
  number_of_players_that_can_still_win.zero?
end

def update_board!(player, square, board)
  board[:layout][square] =
    player[:symbol_marker].map do |row|
      row.map { |character| character.colorize(player[:colors][:symbol_color]) }
    end
  board[:parameters][:available_squares].delete(square)
end

def update_squares_list_in_viable_combos!(player_slot, player_data, square_choice)
  player_data[player_slot][:winning_combos_still_viable].each do |combo|
    combo.delete(square_choice)
  end
end



def update_turn_history!(turn_history, turn)
  turn_history << turn
end

has_seen_welcome_screen = false
loop do
  clear_screen

  has_seen_welcome_screen = true

  board = setup_board
  player_data = setup_player_data(board)

  choose_player_turn_order!(player_data)
  board[:best_of_five] = true
  if board[:best_of_five]
    play_best_of_five(board, player_data)
  else
    play_single_game(board, player_data)
  end

  game_winner = board[:game_winner]

  if game_winner
    congratulate_winner(game_winner, player_data)
  else
    display_tie_game_message
  end

  break unless play_again?
end

display_goodbye_message
