require 'pry'
require 'yaml'

SUITS = %i[♥ ♠ ♦ ♣]

CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].zip(
              [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]]).to_h
              
BEST_POSSIBLE_SCORE = 21
MESSAGES = YAML.load_file('twenty_one.yml')

TOP_OF_CARD_GRAPHIC = MESSAGES['top_card_line']
UPPER_CARD_LABEL_GRAPHIC = ("┃" + "%-9.9s" + "┃")
MID_CARD_GRAPHIC = MESSAGES['mid_card_line']
MIDDLE_CARD_LABEL_GRAPHIC = ("┃" + "%s".center(10) + "┃")
LOWER_CARD_LABEL_GRAPHIC = ("┃" + "%9.9s" + "┃")
BOTTOM_OF_CARD_GRAPHIC = MESSAGES['bottom_card_line']

PROMPT = " =>"
PAUSE_PROMPT = "Press enter to continue #{PROMPT}"

def initialize_deck 
  deck = {}
  SUITS.each do |suit|
    deck[suit] = CARD_VALUES.clone
  end
  deck
end

def setup_dealer
  {  name: 'Dealer', cards_in_hand: [], hand_score: 0,stay: false, busted: false,
     winner: false}
end

def setup_player
  
  name = get_player_name
  { name: name, cards_in_hand: [], hand_score: 0, stay: false, busted: false,
    winner: false}
end

def deal_starting_hands(deck, player, dealer)
  2.times do |_|
    deal_a_card_from_deck_to_participant(deck, player)
    deal_a_card_from_deck_to_participant(deck, dealer)
  end
end

def player_takes_turn(player, dealer, deck)
    
  until busted?(player) 
    clear_screen
    display_participants_hand(dealer)
    display_participants_hand(player)
       
    prompt_player_to_draw_card_or_stay(player)
    break if player[:stay]
    deal_a_card_from_deck_to_participant(deck, player)
  end
  player[:busted] = true unless stay?(player)

  display_participants_hand(dealer)
  display_participants_hand(player)
  puts "Player's score is #{player[:hand_score]}"
  press_enter_to_continue
end

def dealer_takes_turn(dealer, player, deck)

  until busted?(dealer)
    clear_screen
    display_participants_hand(dealer)
    display_participants_hand(player)
    puts dealer[:hand_score]
    if dealer_should_stay?(dealer[:hand_score])    
      dealer[:stay] = true
      break
    end
    deal_a_card_from_deck_to_participant(deck, dealer)
  end

  dealer[:busted] = true unless stay?(dealer)

  display_participants_hand(dealer)
  display_participants_hand(player)
  puts "Dealer's score is #{dealer[:hand_score]}."
  press_enter_to_continue
end

def dealer_should_stay?(hand_score)
  hand_score >= 17
end

def deal_a_card_from_deck_to_participant(deck, participant)
  participant_is_dealer = participant[:name] == 'Dealer'
  card = get_random_card_from_deck(deck)
  suit, value = card
  add_card_to_participants_hand!(participant, card)
  
  if participant_is_dealer
    puts MESSAGES['dealer_drew_card'] % [value, suit]
  else
    puts MESSAGES['player_drew_card'] % [value, suit]
  end
  
  press_enter_to_continue
end

def prompt_player_to_draw_card_or_stay(player)
  puts MESSAGES['draw_or_stay'] % [PROMPT]
  stay_or_draw = get_validated_input(['stay', 'draw'])
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

def busted?(participant)
  participant[:hand_score] > BEST_POSSIBLE_SCORE
end

def stay?(participant)
  participant[:stay]
end

def calculate_total_of_hand(hand)
  hand_total = 0
  hand_has_an_ace = false
  number_of_aces_in_hand = 0

  hand.each do |card|
    card_value_name = card.last
    if card_value_name == 'Ace'
      hand_has_an_ace ||= true 
      number_of_aces_in_hand += 1
      next
    end
    card_value = CARD_VALUES[card_value_name]
    hand_total += card_value
  end
  if hand_has_an_ace
    hand_total += calculate_value_of_aces(hand_total, number_of_aces_in_hand)
  end 
  hand_total
end

def calculate_value_of_aces(hand_total, number_of_aces)
  low_ace_values = number_of_aces
  high_ace_values = number_of_aces + 10
  if high_ace_values + hand_total > BEST_POSSIBLE_SCORE
    low_ace_values
  else
    high_ace_values
  end
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

def congratulate_winner(winner)
  winner_name = winner[:name]
  puts MESSAGES['congratulate_winner'] % [winner_name]
end

def tie?(player_score, dealer_score)
  player_score == dealer_score
end

def display_participants_hand(participant)
  participant_is_dealer = participant[:name] == 'Dealer'
  hand = participant[:cards_in_hand]
  hand_score = participant[:hand_score]
  hand_formatted= []
  hand.each {|suit, value| hand_formatted << value.chr + suit.to_s}
  if participant_is_dealer
    puts "Dealer's Hand"
    display_card_graphics(hand, participant_is_dealer)
  else
    puts "Player's Hand"
    display_card_graphics(hand)
  end
end

def display_card_graphics(hand, dealer_hand=false, final_reveal=false)
  number_of_cards = hand.size
  suits_in_hand, values_in_hand = [], []

  hand.each do |suit, value|
    suits_in_hand << suit
    values_in_hand << value.chr
  end
  if dealer_hand
    unless final_reveal
      suits_in_hand[0] = "#"
      values_in_hand[0] = "#"
    end
  end
  puts TOP_OF_CARD_GRAPHIC * number_of_cards
  puts UPPER_CARD_LABEL_GRAPHIC * number_of_cards % values_in_hand
  puts MID_CARD_GRAPHIC * number_of_cards
  puts MIDDLE_CARD_LABEL_GRAPHIC * number_of_cards % suits_in_hand
  puts MID_CARD_GRAPHIC * number_of_cards
  puts LOWER_CARD_LABEL_GRAPHIC * number_of_cards % values_in_hand
  puts BOTTOM_OF_CARD_GRAPHIC * number_of_cards
end

def display_tie_game_message
  puts MESSAGES['tie_game']
end

def get_player_name
  print MESSAGES['get_player_name']
  get_validated_input
end

def get_validated_input(valid_input_list = '')
  user_input = ''
  
  loop do
    user_input = gets.chomp.strip
    if user_input.empty?
      print MESSAGES['entered_blank_spaces_only'] % [PROMPT]
    else
      break if valid_input_list.include?(user_input) || valid_input_list.empty?
      print MESSAGES['invalid_entry'] % [valid_input_list.join(', '), PROMPT]
    end
  end
  user_input
end

def press_enter_to_continue
  print PAUSE_PROMPT
  gets
end

def clear_screen
  system 'clear'
end

clear_screen
deck = initialize_deck
dealer = setup_dealer
player = setup_player

deal_starting_hands(deck, player, dealer)

player_takes_turn(player, dealer, deck) 
dealer_takes_turn(dealer, player, deck) unless player[:busted]

winner = determine_winner(player, dealer)

if winner
  congratulate_winner(winner)
else
  display_tie_game_message
end




