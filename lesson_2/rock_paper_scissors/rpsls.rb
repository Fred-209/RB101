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

DISPLAY_MESSAGES = YAML.load_file('rpsls.yml')
VALID_CHOICES = %w(rock paper scissors lizard spock r p sc l sp)
WINNING_CHOICES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(lizard paper),
  'lizard' => %w(paper spock),
  'spock' => %w(rock scissors)
}
ABBREVIATIONS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def add_win_to_score(score)
  score += 1
end

def clear_screen
  system('clear')
end

def convert_abbreviation(abbreviation)
  ABBREVIATIONS[abbreviation]
end

def calculate_winner(player_choice, computer_choice)
  if player_choice == computer_choice
    'draw'
  elsif WINNING_CHOICES[player_choice].include?(computer_choice)
    'Player'
  else
    'Computer'
  end
end

def display_intro
  puts "Welcome to Rock Paper Scissors Lizard Spock!"
  print DISPLAY_MESSAGES['intro']
end

def display_choices_prompt
  print "[(R)ock (P)aper (Sc)issors (L)izard (SP)ock]=> "
end

def display_input_prompt
  print "-->"
end

def display_message(message)
end

def display_results(player_choice, computer_choice, round_winner)
  puts "Player choice: #{player_choice.capitalize}"
  puts "Computer choice: #{computer_choice.capitalize}"
  if round_winner == 'draw'
    puts "It's a draw!! Nobody wins."
  else
    puts "#{round_winner} wins!!!"
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

  user_choice
end

def valid_input?(user_choice, *valid_inputs)
  valid_inputs = valid_inputs.flatten
  valid_inputs.include?(user_choice)
end


loop do

  player_score = 0
  computer_score = 0

  clear_screen()
  display_intro()
  player_choice = get_player_choice()
  computer_choice = get_computer_choice()
  round_winner = calculate_winner(player_choice, computer_choice)
  display_results(player_choice, computer_choice, round_winner)
  break unless play_again?()

end


