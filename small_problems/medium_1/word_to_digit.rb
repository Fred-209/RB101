# # Word to Digit


# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
  
# **Rules/Requirements**

# *Input*: a string

# *Output*: the same string, but modified


# *Explicit Requirements*: 
# - replace any instances of 'one', 'two', ..'nine' in the string with the actual number
# - make sure to return the same string

# *Implicit Requirements*: 
#  -


# *Questions:*
# - What to return if the given string has none of these words?
# - Will the number words always be surrounded by spaces?
# - Will the number words always be downcased?
#   - account for this edge case

# *Edge Cases*:
# - Account for a string with no number words in it
# - A blank string should also return a blank string
# - The number words should return a digit regardless of the casing of the number word

# **Examples/Test Cases/Edge Cases**
# word_to_digit(' ') == ' '
# word_to_digit('') == ''
# word_to_digit(' One tWo three FOUr FIVE ') == ' 1 2 3 4 5 '
# word_to_digit(' Hello everybody I hope you're doing well. ') == ' Hello everybody I hope you're doing well. '
# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# **Data Structure**
# Initial: string

# Intermediate: 
# - an array of words made from the given string
# - a hash of words that need to be included
# Final: mutated version of original string



# **Algorithm**

# *High level thought process / brainstorming ideas
# - Create a hash that matches each number word as a key to it's corresponding digit as a value (digit as a string)
#   - { zero: '0', one: '1'...}
# - Convert the given string into an array of words, delimited on space
# - Iterate over the array of words, using map, and if the current word is one of the keys, replace it with the value from created hash for this key
# - Join the transformed array of words and return this string

# *Lower level steps of implementation*
# - Create hash of zero: .. nine: as keys with their associated numbers (as strings) as the values, word_digit_map
# - Iterate over the keys in `word_digit_map`:
  # - use gsub! to replace any found instances of the current key (converted to string) with the value from word_digit_map with this key
  # - return this modified string

# **Code Implementation**

def word_to_digit(sentence)
  return sentence if sentence.strip.empty?
  
  word_digit_map = {
    zero:  '0', 
    one:   '1', 
    two:   '2', 
    three: '3',
    four:  '4',
    five:  '5',
    six:   '6',
    seven: '7', 
    eight: '8',
    nine:  '9'
  }
  
  word_digit_map.each_pair do |key, value|
    sentence.gsub!(/#{key.to_s}/i, value)
  end
  sentence
    
end





p word_to_digit(' ') == ' '
p word_to_digit('') == ''
p word_to_digit("One tWo three FOUr FIVE") == "1 2 3 4 5"
p word_to_digit("Hello everybody I hope you're doing well.") == "Hello everybody I hope you're doing well."
p word_to_digit("Please call me at five five five one two three four. Thanks.") == "Please call me at 5 5 5 1 2 3 4. Thanks."


