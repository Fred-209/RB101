require 'pry'

SUITES = %i[Hearts Spades Diamonds Clubs]
CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].zip(
              [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]]).to_h
SCORE_TO_WIN = 21
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
  {  name: 'Dealer', cards_in_hand: [], stay: false}
end

def setup_player
  
  name = get_validated_input
  { name: name, cards_in_hand: [], stay: false}
end

def deal_starting_hands(deck, player, dealer)
  2.times do |_|
    deal_a_card_from_deck_to_participant(deck, player)
    deal_a_card_from_deck_to_participant(deck, dealer)
  end
end

def deal_a_card_from_deck_to_participant(deck, participant)
  card = get_random_card_from_deck(deck)
  delete_card_from_deck!(deck, card)
  add_card_to_participants_hand!(participant, card)
end

def get_random_card_from_deck(deck)
  suite = deck.keys.sample
  card_name = deck[suite].keys.sample
  [suite, card_name]
end

def delete_card_from_deck!(deck, card)
  suite = card[0]
  card_name = card[1]
  deck[suite].delete(card_name)
end

def add_card_to_participants_hand!(participant, card)
  participant[:cards_in_hand] << card
end

def bust?(hand)
  total_value = calculate_total_of_hand(hand)
  total_value > SCORE_TO_WIN
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
      hand_has_an_ace = true
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
  
  if high_ace_values + hand_total > SCORE_TO_WIN
    low_ace_values
  else
    high_ace_values
  end
end

def clear_screen
  system 'clear'
end

def get_validated_input(valid_input_list=/\S/)
  user_input = ''
  
  loop do
    user_input = gets.chomp.strip
    break if user_input.match?(valid_input_list)
    if user_input.empty?
      print "Your input can't be only blanks spaces. Try again#{PROMPT}"
    else
      puts "Invalid entry. Try again."
      print "Valid choices are [#{valid_input_list.join(', ')}]#{PROMPT}"
    end
  end
  user_input
end

deck = initialize_deck

dealer = setup_dealer
player = setup_player
deal_starting_hands(deck, player, dealer)
# player_takes_turn until bust?(player[:cards_in_hand]) || stay?[player]
# dealer_takes_turn  until bust?(dealer[:cards_in_hand]) || stay?[dealer]
binding.pry






