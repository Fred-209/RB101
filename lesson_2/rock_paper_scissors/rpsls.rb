# rpsls.rb
# Rock, Paper, Scissors, Lizard, Spock
# A take on the classic Rock, Paper, Scissors game that adds 
# 2 new elements to it: Lizard and Spock. 
# From the tv show "The Big Bang Theory"

# Intro
# Explain Rules
# Gameplay
# - Code rules for winning and losing (hash maybe?)
# - best 2 out of three (need to keep track of 2 players score)
# -display the pc/computer choices, win/lose results, score tally, 
#   finaly winner tally
# -play again?
# random ideas: maybe have menu with options for moves to choose from, 
#    Score Count, rules, etc

require 'yaml'
require 'colorize'

DISPLAY_MESSAGES = YAML.load_file('rpsls.yml')
VALID_CHOICES = %w(rock paper scissors lizard spock r p sc l sp)
WINS_AGAINST = {
  'rock'     => %w(scissors lizard),
  'paper'    => %w(rock spock),
  'scissors' => %w(lizard paper),
  'lizard'   => %w(paper spock),
  'spock'    => %w(rock scissors)
}
ABBREVIATIONS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

ATTACKS = {
  'rock'     => { 'lizard' => 'CRUSHES'.colorize(:light_yellow),
                  'scissors' => 'OBLITERATES'.colorize(:magenta)},
  'paper'    => { 'rock' => 'COVERS'.colorize(:light_black),
                  'spock' => 'DISPROVES'.colorize(:light_magenta)},
  'scissors' => { 'paper' => 'CUTS'.colorize(:light_red),
                  'lizard' => 'DECAPITATES'.colorize(:red)},
  'lizard'   => { 'spock' => 'POISONS'.colorize(:green),
                  'paper' => 'EATS'.colorize(:light_white)},
  'spock'    => { 'rock'=> 'VAPORIZES'.colorize(:cyan),
                  'scissors' => 'SMASHES'.colorize(:yellow)}
}

# -------------------- METHOD DEFINITIONS -----------------------

def add_win_to_score(score)
  score += 1
end

def clear_screen
  system('clear')
end

def convert_abbreviation(abbreviation)
  ABBREVIATIONS[abbreviation]
end

def calculate_round_winner(player_name, player_choice, computer_choice) 
  if player_choice == computer_choice
    'draw'
  elsif WINS_AGAINST[player_choice].include?(computer_choice)
    [player_name, player_choice, 'Jerry', computer_choice]
  else
    ['Jerry', computer_choice, player_name, player_choice]
  end
end

def determine_attack_style(winners_weapon, losers_weapon)
  ATTACKS[winners_weapon][losers_weapon]
end

def display_intro_text
  puts "Welcome to Rock Paper Scissors Lizard Spock!"
  print DISPLAY_MESSAGES['intro_text']
end

def display_intro_graphic
  print DISPLAY_MESSAGES['intro_graphic'].colorize(:cyan)
end

def display_choices_prompt
  print "[(R)ock (P)aper (Sc)issors (L)izard (Sp)ock]=> "
end

def display_input_prompt
  print "--> "
end

def display_message(message)
end

def display_outro
  puts DISPLAY_MESSAGES['outro'].colorize(:yellow)
end

def display_results(player_name, player_weapon, computer_weapon, round_winner, 
                    winning_weapon, round_loser, losing_weapon)
  puts
  puts "#{player_name} chooses: #{player_weapon.capitalize}!"
  puts "Jerry chooses: #{computer_weapon.capitalize}!"
  if round_winner == 'draw'
    puts "It's a draw!! Nobody wins.".colorize(:cyan)
  else
    puts "#{round_winner}'s #{winning_weapon.capitalize} "\
         "#{determine_attack_style(winning_weapon, losing_weapon)} "\
         "#{round_loser}'s #{losing_weapon.capitalize}!!!"
    puts
    puts "#{round_winner} wins this round!"
    puts
  end
end

def get_computer_choice
  %w(rock paper scissors lizard spock).sample
end

def get_player_choice
  puts "Which weapon do you choose? Choose wisely..."

  player_choice = ''
  loop do
    display_choices_prompt()
    player_choice = gets.chomp.downcase.strip
    break if valid_input?(player_choice,VALID_CHOICES)
    puts "That's not a valid choice. Choose again."
  end
  
  player_choice = 
    convert_abbreviation(player_choice) if ABBREVIATIONS.include?(player_choice)
  player_choice
end

def get_player_name
  print "What name do you go by? "
  display_input_prompt()
  name = gets.chomp.strip
  name
end

def play_again?
  puts "Would you like to play again?"
  print "Type either 'y' for yes or 'n' for no."

  user_choice = ''
  loop do
    display_input_prompt()
    user_choice = gets.chomp.downcase.strip
    break if valid_input?(user_choice,'y', 'n')
    puts "You have to enter either either 'y' or 'n'. Try again."
  end

  user_choice == 'y'
end

def valid_input?(user_choice, *valid_inputs)
  valid_inputs = valid_inputs.flatten
  valid_inputs.include?(user_choice)
end

# ---------------------- MAIN LOOP ----------------------------------

first_run = true
player_name = ''
loop do
  clear_screen()
  display_intro_graphic()
  display_intro_text() if first_run
  if first_run
    player_name = get_player_name()
    puts "Hello, #{player_name} =-)"
    puts
  end
  player_score = 0
  computer_score = 0
  player_choice = get_player_choice()
  computer_choice = get_computer_choice()
  round_winner, winning_weapon, round_loser, losing_weapon = 
    calculate_round_winner(player_name, player_choice, computer_choice)
  
  display_results(player_name, player_choice, computer_choice, round_winner,
                  winning_weapon, round_loser, losing_weapon)
  first_run = false
  break unless play_again?()

end

display_outro()

