require 'yaml'

SUITS = %i[♥ ♠ ♦ ♣]

CARD_VALUES =
  %w[2 3 4 5 6 7 8 9 10 J Q K A].zip(
    [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]]
  ).to_h

BEST_POSSIBLE_SCORE = 21
DEALER_HIT_THRESHOLD = 17
MESSAGES = YAML.load_file('twenty_one.yml')

TOP_OF_CARD_GRAPHIC = MESSAGES['top_card_line']
UPPER_CARD_LABEL_GRAPHIC = ('┃' + '%-9.9s' + '┃')
MID_CARD_GRAPHIC = MESSAGES['mid_card_line']
MIDDLE_CARD_LABEL_GRAPHIC = ('┃' + '%s'.center(10) + '┃')
LOWER_CARD_LABEL_GRAPHIC = ('┃' + '%9.9s' + '┃')
BOTTOM_OF_CARD_GRAPHIC = MESSAGES['bottom_card_line']

PROMPT = ' => '
PAUSE_PROMPT = "Press enter to continue #{PROMPT}"

def initialize_deck
  deck = {}
  SUITS.each { |suit| deck[suit] = CARD_VALUES.clone }
  deck
end

def setup_dealer
  {
    name: 'Dealer',
    cards_in_hand: [],
    hand_score: 0,
    stay: false,
    busted: false,
    winner: false,
    points: 0
  }
end

def setup_player
  name = ask_player_name
  {
    name: name,
    cards_in_hand: [],
    hand_score: 0,
    stay: false,
    busted: false,
    winner: false,
    points: 0
  }
end

def ask_player_name
  print MESSAGES['ask_player_name']
  get_validated_input
end

def setup_game_stats
  { rounds_played: 0, ties: 0 }
end

def play_multiple_rounds?
  clear_screen
  print format(MESSAGES['play_multiple_rounds'], PROMPT)
  user_choice = get_validated_input(%w[s m])
  user_choice == 'm'
end

def deal_starting_hands(deck, player, dealer)
  display_shuffle_deck_animation

  2.times do |_|
    puts
    deal_a_card_from_deck_to_participant(deck, player)
    puts
    assemble_and_output_card_graphics(player[:cards_in_hand])
    sleep 1.25
    puts
    deal_a_card_from_deck_to_participant(deck, dealer)
    puts
    assemble_and_output_card_graphics(dealer[:cards_in_hand], true)
    sleep 1.25
  end
  press_enter_to_continue
end

def player_takes_turn(player, dealer, deck)
  until busted?(player)
    clear_screen
    display_participants_hand(dealer)
    display_participants_hand(player)
    puts format(
      MESSAGES['player_hand_display'],
      player[:name],
      player[:hand_score]
    )

    prompt_player_to_draw_card_or_stay(player)
    break if player[:stay]
    deal_a_card_from_deck_to_participant(deck, player)
    sleep 1.25
  end

  player[:busted] = true unless stay?(player)
  display_turn_recap(player) unless player[:busted]
end

def dealer_takes_turn(dealer, deck)
  until busted?(dealer)
    clear_screen

    puts "Dealer's turn"
    puts
    display_participants_hand(dealer)
    puts
    sleep 1.25
    if dealer_should_stay?(dealer[:hand_score])
      dealer[:stay] = true
      break
    end
    deal_a_card_from_deck_to_participant(deck, dealer)
    sleep 1.25
  end

  dealer[:busted] = true unless stay?(dealer)
  dealer[:busted] ? display_busted_message(dealer) : display_turn_recap(dealer)
end

def dealer_should_stay?(hand_score)
  hand_score >= DEALER_HIT_THRESHOLD
end

def deal_a_card_from_deck_to_participant(deck, participant)
  participant_is_dealer = participant[:name] == 'Dealer'
  card = get_random_card_from_deck(deck)
  suit, value = card
  add_card_to_participants_hand!(participant, card)

  if participant_is_dealer
    if dealers_first_card?(participant[:cards_in_hand])
      puts MESSAGES['dealers_first_card']
    else
      puts format(MESSAGES['dealer_drew_card'], value, suit)
    end
  else
    puts format(MESSAGES['player_drew_card'], value, suit)
  end
end

def prompt_player_to_draw_card_or_stay(player)
  print format(MESSAGES['draw_or_stay'], PROMPT)
  stay_or_draw = get_validated_input(%w[stay draw])
  update_participant_stay_status!(player, stay_or_draw)
end

def update_participant_stay_status!(player, status)
  player[:stay] = true if status == 'stay'
end

def get_random_card_from_deck(deck)
  suit = deck.keys.sample
  card_name = deck[suit].keys.sample
  card = [suit, card_name]
  delete_card_from_deck!(deck, card)
  card
end

def delete_card_from_deck!(deck, card)
  suit = card[0]
  card_name = card[1]
  deck[suit].delete(card_name)
end

def add_card_to_participants_hand!(participant, card)
  participant[:cards_in_hand] << card
  update_participants_hand_score!(participant)
end

def update_participants_hand_score!(participant)
  hand = participant[:cards_in_hand]
  participant[:hand_score] = calculate_total_of_hand(hand)
end

def calculate_total_of_hand(hand)
  hand_total = sum_of_non_ace_cards(hand)

  if hand_has_an_ace?(hand)
    number_of_aces_in_hand = hand.count { |_, value| value == 'A' }
    hand_total += calculate_value_of_aces(hand_total, number_of_aces_in_hand)
  end
  hand_total
end

def sum_of_non_ace_cards(hand)
  hand_total = 0

  hand.each do |card|
    card_value_name = card.last
    next if card_value_name == 'A'
    card_value = CARD_VALUES[card_value_name]
    hand_total += card_value
  end
  hand_total
end

def hand_has_an_ace?(hand)
  hand.any? { |_, value| value == 'A' }
end

def calculate_value_of_aces(hand_total, number_of_aces)
  ace_score = 11 * number_of_aces

  number_of_aces.times do
    ace_score -= 10 if hand_total + ace_score > BEST_POSSIBLE_SCORE
  end
  ace_score
end

def busted?(participant)
  participant[:hand_score] > BEST_POSSIBLE_SCORE
end

def stay?(participant)
  participant[:stay]
end

def determine_winner(player, dealer)
  if player[:busted]
    dealer[:winner] = true
    return dealer
  elsif dealer[:busted]
    player[:winner] = true
    return player
  end

  player_score = player[:hand_score]
  dealer_score = dealer[:hand_score]

  return nil if tie?(player_score, dealer_score)
  dealer_score > player_score ? dealer : player
end

def dealers_first_card?(cards_in_hand)
  cards_in_hand.count == 1
end

def update_winners_points!(winner)
  winner[:points] += 1
end

def tie?(player_score, dealer_score)
  player_score == dealer_score
end

def display_player_greeting(name)
  puts format(MESSAGES['player_greeting'], name)
  press_enter_to_continue
end

def display_participants_hand(participant, final_result = false)
  participant_is_dealer = participant[:name] == 'Dealer'
  hand = participant[:cards_in_hand]
  hand_formatted = []
  hand.each { |suit, value| hand_formatted << value.chr + suit.to_s }
  if participant_is_dealer
    puts "Dealer's Hand"
    assemble_and_output_card_graphics(hand, participant_is_dealer, final_result)
  else
    puts "Player's Hand"
    assemble_and_output_card_graphics(hand)
  end
end

def display_final_cards(player, dealer)
  clear_screen
  puts MESSAGES['final_card_results']
  display_participants_hand(dealer, true)
  puts "Score: #{dealer[:hand_score]}"
  puts
  display_participants_hand(player)
  puts "Score: #{player[:hand_score]}"
  puts
  press_enter_to_continue
end

def display_shuffle_deck_animation
  print 'Shuffling deck....'
  %w[| / - \\].cycle(3) do |piece|
    print piece
    sleep 0.15
    print "\b"
  end
  puts 'Ready to deal!'
end

def assemble_and_output_card_graphics(
  hand, dealer_hand = false, show_all_dealer_cards = false
)
  number_of_cards = hand.size
  suits_in_hand = hand.map { |card| card[0] }
  values_in_hand = hand.map { |card| card[1] }

  if dealer_hand
    unless show_all_dealer_cards
      suits_in_hand[0] = '#'
      values_in_hand[0] = '#'
    end
  end

  display_card_graphics(number_of_cards, suits_in_hand, values_in_hand)
end

def display_card_graphics(number_of_cards, suits, values)
  puts TOP_OF_CARD_GRAPHIC * number_of_cards
  puts UPPER_CARD_LABEL_GRAPHIC * number_of_cards % values
  puts MID_CARD_GRAPHIC * number_of_cards
  puts MIDDLE_CARD_LABEL_GRAPHIC * number_of_cards % suits
  puts MID_CARD_GRAPHIC * number_of_cards
  puts LOWER_CARD_LABEL_GRAPHIC * number_of_cards % values
  puts BOTTOM_OF_CARD_GRAPHIC * number_of_cards
end

def display_turn_recap(participant)
  clear_screen
  puts 'Turn Recap'
  puts
  display_participants_hand(participant)
  puts format(
    MESSAGES['participant_staying'],
    participant[:name],
    participant[:hand_score]
  )
  press_enter_to_continue
end

def display_busted_message(participant)
  name = participant[:name]
  hand_score = participant[:hand_score]

  display_participants_hand(participant)
  puts format(MESSAGES['busted_message'], hand_score, name)
  press_enter_to_continue
end

def display_game_stats(player, dealer, game_stats)
  player_name = player[:name]
  dealer_name = dealer[:name]
  player_points = player[:points]
  dealer_points = dealer[:points]
  ties = game_stats[:ties]

  puts format(
    MESSAGES['display_game_stats'],
    player_name,
    player_points,
    dealer_name,
    dealer_points,
    ties
  )
end

def congratulate_round_winner(winner)
  winner_name = winner[:name]

  clear_screen
  puts format(MESSAGES['congratulate_round_winner'], winner_name)
end

def congratulate_overall_winner(winner)
  winner_name = winner[:name]
  clear_screen
  puts format(MESSAGES['congratulate_overall_winner'], winner_name)
end

def reset_players!(*participants)
  participants.each do |participant|
    participant[:cards_in_hand] = []
    participant[:hand_score] = 0
    participant[:busted] = false
    participant[:stay] = false
    participant[:winner] = false
  end
end

def play_again?
  print format(MESSAGES['play_again'], PROMPT)
  yes_or_no = get_validated_input(%w[y n])
  yes_or_no == 'y'
end

def get_validated_input(valid_input_list = '')
  user_input = ''

  loop do
    user_input = gets.chomp.strip
    if user_input.empty?
      print format(MESSAGES['entered_blank_spaces_only'], PROMPT)
    else
      break if valid_input_list.include?(user_input) || valid_input_list.empty?
      print format(
        MESSAGES['invalid_entry'],
        valid_input_list.join(', '),
        PROMPT
      )
    end
  end
  user_input
end

def single_game?(points_to_win)
  points_to_win == 1
end

def press_enter_to_continue
  print PAUSE_PROMPT
  gets
end

def clear_screen
  system 'clear'
end

def display_welcome_screen
  clear_screen
  puts MESSAGES['welcome_banner']
  puts MESSAGES['welcome_message']
end

def display_tie_game_message
  clear_screen
  puts MESSAGES['tie_game']
end

def display_goodbye_message
  puts MESSAGES['goodbye_message']
end

first_run = true
loop do
  clear_screen
  if first_run
    display_welcome_screen
    first_run = false
  end

  dealer = setup_dealer
  player = setup_player
  game_stats = setup_game_stats

  display_player_greeting(player[:name])

  points_to_win = play_multiple_rounds? ? 5 : 1

  until player[:points] >= points_to_win || dealer[:points] >= points_to_win
    game_stats[:rounds_played] += 1
    deck = initialize_deck

    clear_screen
    if single_game?(points_to_win)
      puts 'Playing Single Game'
    else
      puts "Starting round #{game_stats[:rounds_played]}"
    end

    deal_starting_hands(deck, player, dealer)
    player_takes_turn(player, dealer, deck)

    if player[:busted]
      display_busted_message(player)
    else
      dealer_takes_turn(dealer, deck)
    end

    display_final_cards(player, dealer)

    winner = determine_winner(player, dealer)

    if winner
      update_winners_points!(winner)
      congratulate_round_winner(winner) unless single_game?(points_to_win)
    else
      display_tie_game_message
      game_stats[:ties] += 1
    end

    unless single_game?(points_to_win)
      display_game_stats(player, dealer, game_stats)
      reset_players!(player, dealer)
      press_enter_to_continue
    end
  end

  congratulate_overall_winner(winner)
  break unless play_again?
end

display_goodbye_message
