# # Madlibs

# Mad libs are a simple game where you create a story template with blanks for

#  words. You, or another player, then construct a list of words and place them
#  into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

# **Rules/Requirements**

# *Input*: 4 arguments, all strings
# *Output*: a string

# *Explicit*:
# - take a noun, verb, adjective, and adverb as the argument strings
# - Return a string sentence (or multiple sentences) that has these 4
#   words substituted for blanks in the original string
# - Prompt the user for this input

# *Implicit*:

# *Questions:*
# - How to handle a blank input string?
#   - do input validation to make sure the string is not empty
# - any other things to validate the input against?

# **Examples/Test Cases**

# ```ruby
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!
# ```

# **Data Structure**
# Initial: 4 string words

# Intermediate:
# Final: A string with the 4 arguments interpolated in

# **Algorithm**

# * Ask the user for 4 separate inputs: a noun, a verb, an adjective, and an adverb.
# Interpolate these 4 into a return string *

# - prompt the user to enter a noun, save as `nound`
#     - repeat above step until the entered input is not empty
# - repeat the above 2 steps for 'verb', 'adjective', and 'adverb'
# - Return the string "launch school has a 'adjective' way of 'verb' a student 'noun' skills 'adverb'."

# **Code Implementation**

def madlibs
  word_types = {
    noun: {
      phrase: 'Enter a noun: ',
      user_choice: ''
    },
    verb: {
      phrase: 'Enter a verb: ',
      user_choice: ''
    },
    adjective: {
      phrase: 'Enter an adjective: ',
      user_choice: ''
    },
    adverb: {
      phrase: 'Enter an adverb: ',
      user_choice: ''
    }
  }

  word_types.each_pair do |type, attributes|
    print attributes[:phrase]

    user_input = ''
    loop do
      user_input = gets.chomp
      break unless user_input.strip.empty?
      print "You didn't enter anything. Try again: "
    end

    attributes[:user_choice] = user_input
  end
  noun, verb, adjective, adverb =
    word_types[:noun][:user_choice],
    word_types[:verb][:user_choice],
    word_types[:adjective][:user_choice],
    word_types[:adverb][:user_choice]
  
    "Launch School has a #{adjective} way of #{verb} a student #{noun} skills #{adverb}."
end

p madlibs
