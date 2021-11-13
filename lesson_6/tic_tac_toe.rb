require 'colorize'

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

def setup_initial_board
  parameters = assign_initial_board_parameters
  layout = create_empty_board_layout(parameters[:total_squares])

  {
    parameters: parameters,
    layout: layout,
    rounds_played: 0,
    tie_game_count: 0,
    round_winner: nil,
    game_winner: nil,
    tied_game: false,
    play_a_series: false,
    points_to_win: 0,
    speed_game: false
  }
end

def assign_initial_board_parameters
  parameters = {}
  parameters[:size] = choose_board_size.to_i
  parameters[:winning_combos] =
    determine_winning_square_combos(parameters[:size])
  parameters[:total_squares] = parameters[:size]**2
  parameters[:available_squares] = (1..parameters[:total_squares]).to_a
  parameters[:max_players] =
    calculate_max_players_for_board_size(parameters[:size])
  parameters
end

def choose_board_size
  valid_board_sizes = (3..10).to_a.map(&:to_s)
  display_board_size_message
  board_size = get_validated_input(valid_board_sizes)
  puts ''
  puts "You chose a #{board_size}x#{board_size} board size."
  pause_screen
  board_size
end

def determine_winning_square_combos(board_size)
  horizontal_combos = calculate_horizontal_winning_combos(board_size)
  vertical_combos = calculate_vertical_winning_combos(board_size)
  diagonal_combos = calculate_diagonal_winning_combos(board_size)

  horizontal_combos + vertical_combos + diagonal_combos
end

def calculate_max_players_for_board_size(board_size)
  max_players =
    case board_size
    when 3, 4
      2
    when 5..7
      3
    when 8, 9
      4
    else
      5
    end
  max_players
end

def create_empty_board_layout(total_number_of_squares)
  empty_board_layout =
    (1..total_number_of_squares).each_with_object({}) do |square, square_grid|
      square_grid[square] = []
      create_empty_square!(square, square_grid)
    end

  labeled_board_layout = empty_board_layout.dup
  empty_board_layout.each_key do |square|
    labeled_board_layout[square][3][3] = square
  end
  labeled_board_layout
end

def create_empty_square!(square, square_grid)
  # For proper visual layout in terminal, spacing is slightly different
  # for labeled squares, because of number of digits in the label
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

def setup_player_data(board)
  default_player_list = %i[player_1 player_2 player_3 player_4 player_5]
  player_data =
    set_player_data_defaults!(
      default_player_list,
      board[:parameters][:winning_combos]
    )
  number_of_players = choose_number_of_players(board)
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

def set_player_data_defaults!(player_list, winning_combos)
  player_data = create_individual_player_attributes(player_list, winning_combos)

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

def create_individual_player_attributes(player_list, winning_combos)
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
        points_scored: 0,
        game_wins: 0,
        winning_combos_still_viable: Marshal.load(Marshal.dump(winning_combos))
      }
    ]
  end
end

def choose_number_of_players(board)
  max_players = board[:parameters][:max_players]
  allowed_number_of_players = (2..max_players).to_a.map(&:to_s)

  display_choose_number_of_players_messages(max_players)
  number_of_players = get_validated_input(allowed_number_of_players)
  puts "#{number_of_players} players will be playing this time!"
  pause_screen
  number_of_players.to_i
end

def choose_human_or_computer(player)
  valid_input = %w[h c]

  clear_screen
  puts "Do you want #{player} to be a human or computer player?"
  display_input_prompt("Type 'H' for human or 'C' for computer")
  human_or_computer_choice = get_validated_input(valid_input)
  puts

  human_or_computer_choice.downcase == 'c' ? 'computer' : 'human'
end

def assign_computer_player_data!(player_slot, player_data)
  computer_opponent =
    choose_computer_opponent(player_slot, player_data).capitalize
  player_data[:available_computer_opponents].delete(computer_opponent)

  set_player_name!(player_slot, player_data, computer_opponent)
  set_player_colors!(player_slot, player_data, computer_opponent)
  set_player_symbol!(player_slot, player_data, computer_opponent)
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

def randomly_choose_computer_opponent?(player, computer_opponents_list)
  puts
  puts "#{player.capitalize} will be a computer opponent."
  print 'Available computer opponents left are '
  puts "[#{computer_opponents_list.join(', ')}]"
  puts 'Do you want to choose the opponent or have it randomly picked for you?'
  display_input_prompt(
    "Type 'C' to (C)hoose an opponent or 'R' to have it " \
      '(R)andomly assigned'
  )

  choose_or_random = get_validated_input(%w[c r])
  choose_or_random.downcase == 'r'
end

def choose_random_opponent(computer_opponents_list)
  puts 'You chose to randomly pick a computer opponent.'
  computer_opponent = computer_opponents_list.sample
  display_thinking_animation('Randomly choosing', 0.3)
  puts "Looks like #{computer_opponent} was chosen!"
  puts
  computer_opponent
end

def choose_computer_opponent_manually(computer_opponents_list)
  puts ''
  puts 'You chose to manually pick your opponent.'
  puts 'The computer opponents have different levels of difficulty.'
  puts 'Bobby is the easiest, Maude and Hans are medium difficulty,'
  puts 'and Ryuk and Player 456 are the strongest.'
  puts 'Who do you choose?'
  puts "Your options are: [#{computer_opponents_list.join(', ')}]"
  display_input_prompt('Type in their name exactly as spelled')
  computer_opponent = get_validated_input(computer_opponents_list)
  puts "You picked #{computer_opponent.capitalize}!"
  computer_opponent
end

def assign_human_player_data!(player_slot, player_data)
  set_player_name!(player_slot, player_data)
  set_player_colors!(player_slot, player_data)
  set_player_symbol!(player_slot, player_data)
end

def set_player_name!(player_slot, player_data, computer_opponent = nil)
  if computer_opponent
    player_data[player_slot][:name] = computer_opponent.to_s
  else
    display_input_prompt("What's the name of #{player_slot}?")
    player_data[player_slot][:name] = get_validated_input([])
  end
end

def set_player_colors!(player_slot, player_data, computer_opponent = nil)
  if computer_opponent
    player_data[player_slot][:colors][:name_color] =
      COMPUTER_OPPONENTS[computer_opponent][:colors][:name_color]

    player_data[player_slot][:colors][:symbol_color] =
      COMPUTER_OPPONENTS[computer_opponent][:colors][:symbol_color]
  else
    player_colors = choose_player_colors(player_data[player_slot][:name])
    player_data[player_slot][:colors][:name_color] = player_colors[0]
    player_data[player_slot][:colors][:symbol_color] = player_colors[1]
  end
end

def choose_player_colors(player_name)
  available_colors = %w[blue red cyan magenta yellow white]
  puts 'What color do you want your symbol marker to be?'
  puts "Available choices are: [#{available_colors.join(', ')}]"
  display_input_prompt('Enter your choice')
  color_choice = get_validated_input(available_colors)
  print "#{player_name} chose #{color_choice} as their name and symbol marker"
  puts 'color.'
  pause_screen
  [color_choice.to_sym, color_choice.to_sym]
end

def set_player_symbol!(player_slot, player_data, computer_opponent = nil)
  if computer_opponent
    player_data[player_slot][:symbol_marker] =
      choose_random_symbol_marker(player_data[:available_symbol_markers])
  else
    player_data[player_slot][:symbol_marker] =
      choose_symbol_marker!(player_data)
  end
  player_data[:available_symbol_markers].delete(
    SYMBOL_MARKERS_MAP.key(player_data[player_slot][:symbol_marker])
  )
end

def choose_random_symbol_marker(available_markers)
  marker = available_markers.sample
  fancy_marker = marker.capitalize.colorize(:light_magenta)
  puts "They chose #{fancy_marker} as their symbol marker!"
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
  match_symbol_choice_to_symbol_layout(symbol)
end

def match_symbol_choice_to_symbol_layout(symbol)
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

def choose_player_turn_order!(player_data)
  active_players = player_data[:active_players]

  turn_order_selection = get_turn_order_selection(active_players, player_data)
  player_data[:active_players] = turn_order_selection
  puts ''
  puts 'The turn order will be '
  puts ''

  turn_order_selection.each do |player|
    name = player_data[player][:name]
    name_color = player_data[player][:colors][:name_color]
    puts name.colorize(name_color)
  end
  puts ''
  pause_screen
end

def get_turn_order_selection(active_players, player_data)
  clear_screen
  display_turn_order_choices
  turn_order_menu_choice = get_validated_input(%w[1 2 3])
  turn_order =
    case turn_order_menu_choice
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

def choose_who_goes_first(active_players, player_data)
  number_of_players = active_players.size
  active_players.each_with_index do |player, idx|
    puts "#{idx + 1}. #{player_data[player][:name]}"
  end

  display_input_prompt("Choose [#{(1...number_of_players).to_a.join(', ')} or ")
  display_input_prompt("#{number_of_players}]")
  user_pick = get_validated_input((1..number_of_players).to_a.map(&:to_s))
  active_players[user_pick.to_i - 1]
end

def choose_single_game_or_series!(board)
  display_single_game_or_series_choice_messages

  single_game_or_series_choice = get_validated_input(%w[1 2])
  if single_game_or_series_choice == '1'
    puts 'You chose to play a single game.'
    pause_screen
  else
    display_choose_number_of_points_to_win_messages
    points_to_win = get_validated_input((2..10).to_a.map(&:to_s))

    puts ''
    puts "You chose to play until someone has scored #{points_to_win} points."
    pause_screen

    board[:play_a_series] = true
    board[:points_to_win] = points_to_win.to_i
  end
end

def offer_speed_game_option!(board)
  display_speed_game_messages
  speed_game_choice = get_validated_input(%w[y n])
  if speed_game_choice == 'y'
    puts 'You chose to run a speed game(s).'
    pause_screen
    board[:speed_game] = true
  else
    puts 'You chose not to run a speed game(s).'
    pause_screen
  end
end

def series_of_games_was_chosen?(board)
  board[:play_a_series]
end

def play_a_series_game(board, player_data)
  play_rounds_until_game_winner!(board, player_data)

  winner_name = player_data[board[:game_winner]][:name]
  puts "#{winner_name} scored #{board[:points_to_win]} points!"
  if board[:speed_game]
    display_speed_game_recap(board, player_data, winner_name)
  end
  pause_screen

  board[:play_a_series] = false
  board[:speed_game] = false
  board[:rounds_played] = 0
end

def play_rounds_until_game_winner!(board, player_data)
  clear_screen
  display_thinking_animation('Calculating winner...', 0.2) if board[:speed_game]
  until board[:game_winner]
    play_single_round_until_winner_or_tie!(board, player_data)
    update_board_with_round_results!(board, player_data)
    unless board[:speed_game]
      display_non_speed_game_messages(board, player_data)
    end

    reset_board_for_new_round!(board)
    reset_players_turn_histories_and_winning_combos!(board, player_data)
  end
end

def play_single_round_until_winner_or_tie!(board, player_data)
  active_players = player_data[:active_players]

  until board[:round_winner] || board[:tied_game]
    active_players.each do |current_player_slot|
      take_a_turn(board, current_player_slot, player_data)
      check_for_winner_or_tie(board, current_player_slot, player_data)
      break if board[:round_winner] || board[:tied_game]
    end
  end
end

def take_a_turn(board, current_player_slot, player_data)
  display_board(board) unless board[:speed_game]
  if player_data[current_player_slot][:human_or_computer] == 'human'
    human_player_takes_a_turn(board, current_player_slot, player_data)
  else
    computer_player_takes_a_turn(board, current_player_slot, player_data)
  end
  remove_unviable_square_combos!(player_data[:active_players], player_data)
end

def human_player_takes_a_turn(board, player_slot, player_data)
  player = player_data[player_slot]
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

def human_player_chooses_square(board, player_name)
  valid_squares = board[:parameters][:available_squares].map(&:to_s)

  display_board(board)
  puts 'Look at the board above and choose a square number.'
  display_input_prompt("Which square do you want to mark, #{player_name}?")

  get_validated_input(valid_squares).to_i
end

def computer_player_takes_a_turn(board, player_slot, player_data)
  player = player_data[player_slot]
  turn_history = player[:turn_history]
  player_name = player[:name].colorize(player[:colors][:name_color])
  speed_game = board[:speed_game]

  square_choice =
    computer_player_chooses_square(board, player_slot, player, player_data)
  update_turn_history!(turn_history, square_choice)
  update_board!(player, square_choice, board)
  update_squares_list_in_viable_combos!(player_slot, player_data, square_choice)

  unless speed_game
    display_thinking_animation("#{player_name} is thinking", 0.2)
    display_board(board)
    puts "#{player_name} chose to mark square #{square_choice}!"
    pause_screen
  end
end

def computer_player_chooses_square(board, player_slot, player, player_data)
  ai_difficulty_level = COMPUTER_OPPONENTS[player[:name].to_sym][:difficulty]

  square_choice =
    case ai_difficulty_level
    when 1
      choose_level_1_ai_square(board, player_slot, player_data)
    when 2
      choose_level_2_ai_square(board, player_slot, player_data)
    when 3
      choose_level_3_ai_square(board, player_slot, player_data)
    end

  square_choice
end

def choose_level_1_ai_square(board, player_slot, player_data)
  available_squares = board[:parameters][:available_squares]
  intelligence_score = rand(1..10)
  random_available_square = random_square_choice(available_squares)

  if intelligence_score > 8
    winning_square =
      get_other_players_winning_squares_if_exist(
        board,
        player_slot,
        player_data
      )
  end

  winning_square || random_available_square
end

def choose_level_2_ai_square(board, player_slot, player_data)
  available_squares = board[:parameters][:available_squares]
  intelligence_score = rand(1..10)
  random_available_square = random_square_choice(available_squares)
  possible_winning_square =
    get_other_players_winning_squares_if_exist(board, player_slot, player_data)
  player_turn_history = player_data[player_slot][:turn_history]

  if player_turn_history.empty?
    choose_middle_or_corner_square(board)
  elsif intelligence_score > 7 && possible_winning_square
    possible_winning_square
  else
    random_available_square
  end
end

def choose_level_3_ai_square(board, player_slot, player_data)
  selection_criteria =
    assign_square_selection_criteria(board, player_slot, player_data)
  choose_best_square_option(selection_criteria, board)
end

def assign_square_selection_criteria(board, player_slot, player_data)
  criteria = {}
  criteria[:intelligence_score] = rand(1..10)
  criteria[:random_available_square] =
    random_square_choice(board[:parameters][:available_squares])
  criteria[:turn_history] = player_data[player_slot][:turn_history]
  criteria[:closest_winning_combo] =
    choose_closest_completed_combo_if_exists(player_slot, player_data)
  criteria[:number_of_squares_needed_to_win] =
    criteria[:closest_winning_combo] ? criteria[:closest_winning_combo].size : 0
  criteria[:another_players_winning_square] =
    get_other_players_winning_squares_if_exist(board, player_slot, player_data)

  criteria
end

def choose_closest_completed_combo_if_exists(current_player_slot, player_data)
  viable_combos = player_data[current_player_slot][:winning_combos_still_viable]
  closest_completed_combo = viable_combos.min_by(&:size)
  closest_completed_combo
end

def get_other_players_winning_squares_if_exist(board, player_slot, player_data)
  current_player_name = player_data[player_slot][:name]
  winning_combos = board[:parameters][:winning_combos]
  available_squares = board[:parameters][:available_squares]
  active_players = player_data[:active_players]
  find_game_winning_square(
    winning_combos,
    active_players,
    player_data,
    current_player_name,
    available_squares
  )
end

def find_game_winning_square(
  winning_combos,
  active_players,
  player_data,
  current_player_name,
  available_squares
)
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

def choose_best_square_option(criteria, board)
  if criteria[:intelligence_score] < 3
    criteria[:random_available_square]
  elsif criteria[:turn_history].empty?
    choose_middle_or_corner_square(board)
  elsif criteria[:number_of_squares_needed_to_win] == 1
    criteria[:closest_winning_combo].first
  elsif criteria[:another_players_winning_square]
    criteria[:another_players_winning_square]
  elsif criteria[:closest_winning_combo]
    random_square_choice(criteria[:closest_winning_combo])
  else
    criteria[:random_available_square]
  end
end

def choose_middle_or_corner_square(board)
  available_squares = board[:parameters][:available_squares]

  middle_square = (board[:parameters][:total_squares] / 2) + 1
  corner_squares = get_corner_squares(board)

  if available_squares.include?(middle_square)
    middle_square
  elsif available_squares.any? { |square| corner_squares.include?(square) }
    common_squares = (available_squares & corner_squares)
    random_square_choice(common_squares)
  else
    random_square_choice(available_squares)
  end
end

def get_corner_squares(board)
  nw_corner_square = 1
  ne_corner_square = board[:parameters][:size]
  sw_corner_square =
    board[:parameters][:total_squares] - board[:parameters][:size]
  se_corner_square = board[:parameters][:total_squares]
  [nw_corner_square, ne_corner_square, sw_corner_square, se_corner_square]
end

def random_square_choice(available_squares)
  available_squares.sample
end

def play_single_game(board, player_data)
  active_players = player_data[:active_players]

  clear_screen
  until board[:round_winner] || board[:tied_game]
    active_players.each do |current_player_slot|
      take_a_turn(board, current_player_slot, player_data)
      check_for_winner_or_tie(board, current_player_slot, player_data)
      break if board[:round_winner] || board[:tied_game]
    end
  end

  display_board(board)
  return if board[:tied_game]
  set_game_winner!(board, board[:round_winner])
  increment_player_game_wins!(board[:game_winner], player_data)
end

def calculate_horizontal_winning_combos(board_size)
  winning_combos = []
  first_square = 1
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
    set_round_winner!(board, current_player_slot)
    increment_player_score!(player_data, current_player_slot)
  elsif tie_game?(player_data[:active_players], player_data)
    board[:tied_game] = true
  end
end

def current_player_has_won?(turn_history, winning_combos)
  winning_combos.any? { |combo| (combo.difference(turn_history)).empty? }
end

def increment_player_game_wins!(player_slot, player_data)
  player_data[player_slot][:game_wins] += 1
end

def increment_player_score!(player_data, player)
  player_data[player][:points_scored] += 1
end

def remove_unviable_square_combos!(all_active_players, player_data)
  all_active_players.each do |player_slot|
    viable_square_combos =
      player_data[player_slot][:winning_combos_still_viable]
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

def repopulate_available_board_squares!(board)
  board[:parameters][:available_squares] =
    (1..board[:parameters][:total_squares]).to_a
end

def repopulate_players_winning_combos!(player_data, board)
  player_data[:active_players].each do |player|
    player_data[player][:winning_combos_still_viable] =
      Marshal.load(Marshal.dump(board[:parameters][:winning_combos]))
  end
end

def reset_players_turn_histories_and_winning_combos!(board, player_data)
  erase_all_players_turn_histories!(player_data)
  repopulate_players_winning_combos!(player_data, board)
end

def reset_board_for_new_round!(board)
  repopulate_available_board_squares!(board)
  board[:layout] = create_empty_board_layout(board[:parameters][:total_squares])
  board[:round_winner] = nil
  board[:tied_game] = false
end

def set_round_winner!(board, player_slot)
  board[:round_winner] = player_slot
end

def set_game_winner!(board, player_slot)
  board[:game_winner] = player_slot
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

def update_squares_list_in_viable_combos!(
  player_slot,
  player_data,
  square_choice
)
  player_data[player_slot][:winning_combos_still_viable].each do |combo|
    combo.delete(square_choice)
  end
end

def update_board_with_round_results!(board, player_data)
  board[:rounds_played] += 1
  round_winner = board[:round_winner]
  board[:tie_game_count] += 1 if board[:tied_game]

  if round_winner &&
     player_data[round_winner][:points_scored] >= board[:points_to_win]
    set_game_winner!(board, round_winner)
    increment_player_game_wins!(board[:game_winner], player_data)
  end
end

def update_turn_history!(turn_history, turn)
  turn_history << turn
end

def erase_all_players_turn_histories!(player_data)
  player_data[:active_players].each do |player|
    player_data[player][:turn_history] = []
  end
end

def all_players_are_computers?(player_data)
  active_players = player_data[:active_players]
  active_players.all? do |player|
    player_data[player][:human_or_computer] == 'computer'
  end
end

def play_again?
  display_input_prompt('Do you want to play again?')
  valid_input = %w[y n]
  choice = get_validated_input(valid_input)
  choice.downcase == 'y'
end

def congratulate_winner(winner, player_data)
  player_name = player_data[winner][:name]
  player_color = player_data[winner][:colors][:name_color]

  puts ''
  puts "Congratulations #{player_name.colorize(player_color)}!".center(80)
  puts 'You won the game!'.colorize(:light_cyan).center(80)
  puts ''
end

def display_all_players_series_points_score(player_data)
  player_data[:active_players].each do |player|
    name_color = player_data[player][:colors][:name_color]
    print "#{player_data[player][:name].colorize(name_color)}: "
    puts player_data[player][:points_scored]
  end
end

def display_board(board)
  # The board is a grid layout of X by X squares where X is the size of the
  # board chosen. Each square consists of a 7x7 grid of character spaces.
  # A row is defined as a horizontal row of these squares
  # A line is defined as a single row of character spaces that stretch from
  # the first square in a row to the last square in a row

  board_grid = board[:layout]
  number_of_rows = board[:parameters][:size]
  number_of_squares_per_row = board[:parameters][:size]
  first_square_in_row = 1
  last_square_in_row = board[:parameters][:size]

  clear_screen
  number_of_rows.times do
    display_all_lines_in_a_row_of_squares(
      board_grid,
      first_square_in_row,
      last_square_in_row
    )
    unless last_row_of_squares?(board, last_square_in_row)
      display_row_separator(number_of_squares_per_row)
    end
    first_square_in_row += number_of_squares_per_row
    last_square_in_row += number_of_squares_per_row
  end
  puts ''
end

def display_all_lines_in_a_row_of_squares(
  board_grid,
  first_square_in_row,
  last_square_in_row
)
  # middle squares are all squares in a row except the first and last square
  line_number = 0
  middle_squares_range = ((first_square_in_row + 1)...last_square_in_row)
  until line_number > 6
    temp_line =
      board_grid[first_square_in_row][line_number].join + '|'.colorize(:yellow)
    middle_squares_range.each do |square_number|
      temp_line +=
        board_grid[square_number][line_number].join + '|'.colorize(:yellow)
    end
    temp_line += board_grid[last_square_in_row][line_number].join
    print temp_line
    puts
    line_number += 1
  end
end

def display_row_separator(number_of_squares_per_row)
  row_separator = '-------'.colorize(:yellow) + '+'.colorize(:red)
  row_separator_last_square = '-------'.colorize(:yellow)

  puts(
    (row_separator * (number_of_squares_per_row - 1)) +
      row_separator_last_square
  )
end

def last_row_of_squares?(board, last_square_in_row)
  last_square_in_row == board[:parameters][:total_squares]
end

def clear_screen
  system('clear')
end

def get_validated_input(valid_input)
  user_input = ''
  loop do
    user_input = gets.chomp
    until !user_input.strip.empty?
      puts "Your input can't be only blank spaces."
      display_input_prompt('Please try again')
      user_input = gets.chomp
    end

    if valid_input.any? { |valid_string| valid_string.casecmp?(user_input) } ||
                        valid_input.empty?
      break
    end

    puts "That's not a valid choice."
    display_input_prompt(
      "Choose one of the following: [#{valid_input.join(', ')}]"
    )
  end
  user_input
end

def pause_screen
  display_input_prompt('Press enter to continue')
  gets
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

def display_board_size_message
  puts 'Please choose what size of player board you want.'
  puts 'Enter a single number and the board will be a grid of that size.'
  puts 'Example: If you want a 3x3 board, type 3. A 9x9 board, type 9.'
  puts '3x3 is the minimum board size, 10x10 is the max.'
  puts ''
  display_input_prompt('Enter your board size choice [3 - 10]')
end

def display_choose_number_of_players_messages(max_players)
  clear_screen
  puts 'Choose the total number of players (including computer opponents).'
  puts 'This can be anywhere from 2 to 5 players, but the board size dictates'
  puts 'how many you can choose. '
  puts ''
  puts 'For board sizes of 3 or 4, max number of players is 2'
  puts 'For board sizes of between 5 and 7, max players is 3.'
  puts 'For board sizes of 8 or 9, max players is 4.'
  puts 'And for a board size of 10, you can have up to 5 players.'
  puts ''
  puts "Keep in mind if you're running a speed game of computer VS computer"
  puts 'matches that large boards with longer series of games may take a long'
  puts 'time to run. The max number of players for your chosen board size '
  puts "is #{max_players}."
  display_input_prompt('Enter the number of players')
end

def display_choose_number_of_points_to_win_messages
  puts ''
  puts 'How many points should a player score before being'
  puts 'declared the winner? Each game win is worth 1 point.'
  puts 'You can choose any number from 2 through 10'
  puts ''
  display_input_prompt('Enter [2, 3, 4, 5, 6, 7, 8 , 9, or 10]')
end

def display_goodbye_message
  clear_screen
  puts ''
  puts 'Thanks for Playing! Goodbye!!'.colorize(:light_cyan).center(80)
  puts ''
end

def display_input_prompt(message)
  print message.colorize(:light_cyan) + PROMPT.colorize(:light_magenta)
end

def display_non_speed_game_messages(board, player_data)
  if board[:tied_game]
    puts 'Looks like a tie this round! Noone scores.' if board[:tied_game]
  else
    puts "#{player_data[board[:round_winner]][:name]} won this round!"
  end
  display_score_recap_messages(board, player_data)
end

def display_score_recap_messages(board, player_data)
  puts "Here's the score so far:"
  display_all_players_series_points_score(player_data)
  puts "Tie games: #{board[:tie_game_count]}"
  pause_screen
end

def display_speed_game_messages
  clear_screen
  puts 'It looks like all the players are computer players.'
  puts 'Would you like to speed up the game(s)?'
  puts 'They will battle it out and you will only see the final'
  puts 'board result if you choose this.'
  display_input_prompt('Speed game? [y or n]')
end

def display_single_game_or_series_choice_messages
  clear_screen
  puts ''
  puts 'Do you want to play a single game or a series of games?'
  puts 'In a series, you play multiple rounds of Tic Tac Toe until'
  puts 'one player reaches a certain score.'
  puts ''
  puts ' 1. Single Game'
  puts ' 2. Series Of Games'
  puts ''
  display_input_prompt('Type 1 or 2')
end

def display_speed_game_recap(board, player_data, winner_name)
  puts ''
  puts "It took #{winner_name} #{board[:rounds_played]} rounds to win!"
  puts ''
  puts 'Final scores are:'
  display_all_players_series_points_score(player_data)
  puts "Tie games: #{board[:tie_game_count]}"
  puts ''
end

def display_square_choice_prompt(available_squares)
  puts 'Which square do you want to mark?'
  puts ''
  puts 'Enter a number from one of the available square choices left'
  display_available_squares(available_squares)
  print PROMPT
end

def display_symbol_marker_choice_message(available_symbols)
  clear_screen
  puts ''
  puts "In this version of the game, you don't have to choose only between"
  puts 'being an X or an O.'
  puts 'This expanded version lets you choose between the usual X or O,'
  puts 'but also a Square, Triangle'
  puts 'or Plus sign shape as your board marker.'
  puts ''
  puts 'Choose from the menu:'
  puts "- 'X' for X marker"
  puts "- 'O' for O marker"
  puts "- 'Square' for a square marker"
  puts "- 'Triangle' for a triangle marker"
  puts "- 'Plus_sign' for a plus sign marker"
  puts ''
  puts 'Some symbols may have already been chosen by another player.'
  puts "The available symbols are:[#{available_symbols.join(', ')}]"
  display_input_prompt('Please enter your choice')
end

def display_tie_game_message
  puts 'It looks like either there are no empty squares to pick from on the'
  puts "board, or it's impossible for anyone to win now because there are"
  puts 'no more winning combinations left for anyone.'
  puts 'TIE GAME!!'
  puts ''
end

def display_turn_order_choices
  puts 'Do you want to keep the default turn order, or change it?'
  puts 'Make your choice from the menu below:'
  puts ''
  puts '1. Keep the default turn order.'
  puts '2. Shuffle the turn order randomly.'
  puts '3. Choose who goes first.'
  puts ''
  display_input_prompt('Which do you choose [1, 2, or 3]?')
end

def display_welcome_screen
  clear_screen
  puts ''
  puts 'Welcome to Tic Tac Toe!'.colorize(:light_cyan).center(80)
  puts ''
  puts "This version of the classic game of X's and O's can be played with up "
  puts 'to 5 players, and this can be any combination of human or computer '
  puts 'players. The game board can be the traditional 3x3 grid of squares, or '
  puts 'you can choose any grid size from 3x3 up to 10x10.'
  puts
end

first_run = true
loop do
  clear_screen
  display_welcome_screen if first_run

  board = setup_initial_board
  player_data = setup_player_data(board)

  choose_player_turn_order!(player_data)
  choose_single_game_or_series!(board)
  offer_speed_game_option!(board) if all_players_are_computers?(player_data)

  if series_of_games_was_chosen?(board)
    play_a_series_game(board, player_data)
  else
    play_single_game(board, player_data)
  end

  game_winner = board[:game_winner]

  if game_winner
    congratulate_winner(game_winner, player_data)
  else
    display_tie_game_message
  end

  first_run = false
  break unless play_again?
end

display_goodbye_message
