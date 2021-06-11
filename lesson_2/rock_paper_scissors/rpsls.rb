# rpsls.rb
# Rock, Paper, Scissors, Lizard, Spock
# A take on the classic Rock, Paper, Scissors game that adds
# 2 new elements to it: Lizard and Spock.
# Invented by Sam Kass and Karen Bryla

require 'yaml'
require 'colorize'

DISPLAY_MESSAGES = YAML.load_file('rpsls.yml')
VALID_CHOICES = %w[rock paper scissors lizard spock r p sc l sp]
WINS_AGAINST = {
  'rock'     => %w[scissors lizard],
  'paper'    => %w[rock spock],
  'scissors' => %w[lizard paper],
  'lizard'   => %w[paper spock],
  'spock'    => %w[rock scissors]
}
ABBREVIATIONS = {
  'r'  => 'rock',
  'p'  => 'paper',
  'sc' => 'scissors',
  'l'  => 'lizard',
  'sp' => 'spock'
}

ATTACKS = {
  'rock'     => { 'lizard'   => 'CRUSHES'.colorize(:light_yellow),
                  'scissors' => 'OBLITERATES'.colorize(:magenta) },
  'paper'    => { 'rock'     => 'COVERS'.colorize(:light_black),
                  'spock'    => 'DISPROVES'.colorize(:light_magenta) },
  'scissors' => { 'paper'    => 'CUTS'.colorize(:light_red),
                  'lizard'   => 'DECAPITATES'.colorize(:red) },
  'lizard'   => { 'spock'    => 'POISONS'.colorize(:green),
                  'paper'    => 'EATS'.colorize(:light_white) },
  'spock'    => { 'rock'     => 'VAPORIZES'.colorize(:cyan),
                  'scissors' => 'SMASHES'.colorize(:yellow) }
}

COLORS = [
  :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow,
  :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :default
]

# -------------------- METHOD DEFINITIONS -----------------------

def clear_screen
  system('clear')
end

def calculate_round_winner(player_name, player_weapon, jerrybot_weapon)
  if player_weapon == jerrybot_weapon
    'tie'
  elsif WINS_AGAINST[player_weapon].include?(jerrybot_weapon)
    [player_name, player_weapon, 'JerryBot', jerrybot_weapon]
  else
    ['JerryBot', jerrybot_weapon, player_name, player_weapon]
  end
end

def convert_abbreviation(abbreviation)
  ABBREVIATIONS[abbreviation]
end

def determine_attack_style(winners_weapon, losers_weapon)
  ATTACKS[winners_weapon][losers_weapon]
end

def display_grand_champion(grand_champion, jerrybot_color, player_name)
  grand_champion = jerrybot_color if grand_champion == 'JerryBot'

  gc_color_string = ''
  'GRAND CHAMPION!!'.each_char do |letter|
    gc_color_string << letter.colorize(COLORS.sample)
  end

  puts "It looks like #{grand_champion} is our #{gc_color_string}"
  if grand_champion == jerrybot_color
    puts "You win some, you lose some. Better luck next time #{player_name}."
    puts
  end
end

def display_choices_prompt
  puts
  puts "Which weapon do you choose?"
  puts "Abbreviations are ok."
  puts
  print "[(R)ock (P)aper (Sc)issors (L)izard (Sp)ock]=> "
end

def display_input_prompt
  print "--> "
end

def display_intro_graphic
  print DISPLAY_MESSAGES['intro_graphic'].colorize(:cyan)
end

def display_intro_text
  puts "Welcome to Rock Paper Scissors Lizard Spock!"
  print DISPLAY_MESSAGES['intro_text']
end

def display_outro
  puts DISPLAY_MESSAGES['outro'].colorize(:yellow)
end

def display_round_results(round_winner, winning_weapon, round_loser,
                          losing_weapon, jerrybot_color)

  round_winner = jerrybot_color if round_winner == 'JerryBot'

  puts "#{round_winner}'s #{winning_weapon.capitalize} "\
       "#{determine_attack_style(winning_weapon, losing_weapon)} "\
       "#{round_loser}'s #{losing_weapon.capitalize}!!!"
  puts
  puts "#{round_winner} wins this round!"
  puts
end

def display_score(score, player)
  puts "The score so far is:"
  puts "#{player}: #{score[player]}  #{'JerryBot'.colorize(:light_red)}: "\
       "#{score['JerryBot']}  Ties: #{score['tie']}"
  puts "---------------------------------------------------------------------"
  puts
end

def display_tie
  puts
  puts "It's a tie! Noone gets a point this round."
  puts
end

def display_weapon_choices(player_name, player_weapon, jerrybot_color,
                           jerrybot_weapon)
  puts
  puts "#{player_name} chooses: #{player_weapon.capitalize}!"
  puts "#{jerrybot_color} chooses: #{jerrybot_weapon.capitalize}!"
  puts
end

def get_jerrybot_weapon_choice
  %w[rock paper scissors lizard spock].sample
end

def get_player_name
  print "What name do you go by? "
  display_input_prompt()
  name = gets.chomp.strip
  name.colorize(:cyan)
end

def get_player_weapon_choice
  player_choice = ''
  loop do
    display_choices_prompt()
    player_choice = gets.chomp.downcase.strip
    break if valid_input?(player_choice, VALID_CHOICES)
    puts "That's not a valid choice. Choose again."
  end

  if ABBREVIATIONS.include?(player_choice)
    player_choice = convert_abbreviation(player_choice)
  end
  player_choice
end

def play_again?
  puts "Would you like to play again?"
  print "Type either 'y' for yes or 'n' for no."

  user_choice = ''
  loop do
    display_input_prompt()
    user_choice = gets.chomp.downcase.strip
    break if valid_input?(user_choice, 'y', 'n')
    puts "You have to enter either either 'y' or 'n'. Try again."
  end

  user_choice == 'y'
end

def valid_input?(user_choice, *valid_inputs)
  valid_inputs = valid_inputs.flatten
  valid_inputs.include?(user_choice)
end

# ---------------------- MAIN BODY ----------------------------------

first_run = true
player_name = ''
jerrybot_color = 'JerryBot'.colorize(:light_red)

loop do
  clear_screen()
  display_intro_graphic()

  if first_run
    display_intro_text()
    player_name = get_player_name()
    puts
    puts "Hello, #{player_name} =-)"
    puts
  end

  score = { player_name => 0, 'JerryBot' => 0, 'tie' => 0 }
  until score[player_name] == 3 || score['JerryBot'] == 3
    player_weapon = get_player_weapon_choice()
    jerrybot_weapon = get_jerrybot_weapon_choice()

    round_winner, winning_weapon, round_loser, losing_weapon =
      calculate_round_winner(player_name, player_weapon, jerrybot_weapon)

    score[round_winner] += 1
    display_weapon_choices(player_name, player_weapon, jerrybot_color,
                           jerrybot_weapon)

    if round_winner == 'tie'
      display_tie()
    else
      display_round_results(round_winner, winning_weapon, round_loser,
                            losing_weapon, jerrybot_color)
    end
    display_score(score, player_name)

  end

  grand_champion = score.key(3)
  display_grand_champion(grand_champion, jerrybot_color, player_name)

  first_run = false
  break unless play_again?()
end

display_outro()
