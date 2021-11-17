require 'pry'

SUITES = %i[Hearts Spades Diamonds Clubs]
CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
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
  {  name: 'Dealer', cards_in_hand: []}
end

def setup_player
  
  name = get_validated_input
  { name: name, cards_in_hand: []}
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
  card_value = deck[suite].sample
  [suite, card_value]
end

def delete_card_from_deck!(deck, card)
  suite = card[0]
  card_value = card[1]
  deck[suite].delete(card_value)
end

def add_card_to_participants_hand!(participant, card)
  participant[:cards_in_hand] << card
end

def clear_screen
  system 'clear'
end

def get_validated_input(valid_input_list=nil)
  if valid_input_list
    user_input = ''
    loop do
      user_input = gets.chomp.strip
      break if valid_input_list.include?(user_input)
      puts "That's not a valid entry. Try again"
      print "Valid choices are [#{valid_input_list.join(', ')}]#{PROMPT}"
    end
  else
    user_input = gets.chomp.strip
  end
  user_input
end

deck = initialize_deck
dealer = setup_dealer
player = setup_player
deal_starting_hands(deck, player, dealer)
binding.pry


