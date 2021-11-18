require 'pry'
require 'yaml'

SUITES = %i[Hearts Spades Diamonds Clubs]

CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].zip(
              [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]]).to_h
              
BEST_POSSIBLE_SCORE = 21
MESSAGES = YAML.load_file('twenty_one.yml')
PROMPT = " =>"


# initialize deck

def initialize_deck 
  deck = {}
  SUITES.each do |suite|
    deck[suite] = CARD_VALUES.clone
  end
  deck
end

def setup_dealer
  {  name: 'Dealer', cards_in_hand: [], hand_score: 0,stay: false, busted: false}
end

def setup_player
  
  name = get_player_name
  { name: name, cards_in_hand: [], hand_score: 0, stay: false, busted: false}
end

def deal_starting_hands(deck, player, dealer)
  2.times do |_|
    deal_a_card_from_deck_to_participant(deck, player)
    deal_a_card_from_deck_to_participant(deck, dealer)
  end
end

def player_takes_turn(player, deck)
  until busted?(player) || stay?(player)
    display_player_hand(player)
    prompt_player_to_draw_card_or_stay(player)
    break if player[:stay]
    card = get_random_card_from_deck(deck)
    add_card_to_participants_hand!(player, card)
  end
end

def deal_a_card_from_deck_to_participant(deck, participant)
  card = get_random_card_from_deck(deck)
  add_card_to_participants_hand!(participant, card)
 
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
  suite = deck.keys.sample
  card_name = deck[suite].keys.sample
  card = [suite, card_name]
  delete_card_from_deck!(deck, card)
  card
end

def delete_card_from_deck!(deck, card)
  suite = card[0]
  card_name = card[1]
  deck[suite].delete(card_name)
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

def display_player_hand(player)
  hand = player[:cards_in_hand]
  hand_score = player[:hand_score]
  puts MESSAGES['display_player_hand'] % [hand, hand_score]
end

def get_player_name
  print MESSAGES['get_player_name']
  get_validated_input
end

def clear_screen
  system 'clear'
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

deck = initialize_deck

dealer = setup_dealer
player = setup_player
deal_starting_hands(deck, player, dealer)
player_takes_turn(player, deck) 
# dealer_takes_turn  until busted?(dealer) || stay?[dealer]
binding.pry






