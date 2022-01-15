
# **Rules/Requirements**

# *Input*: string (words seperated by whitespace)

# *Output*: string


# *Explicit Requirements*: 
# - each letter in the alphabet should represent a score from 1-26
#   - a is 1, b 2, etc
# - return the string (word from original string) that scores the highest
# based on this number ranking
# - if two words have the same score, return the word that appeared first in the original string
# - all inputs will be valid
# - all letters in the string will be lowercase


# *Implicit Requirements*: 
#  - assuming all characters in the input string 
# will be either a lowercase letter or whitespace


# *Questions:*

# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby

# ```

# **Data Structure**
# Initial: string 

# Intermediate: array of words, array of characters, hash to store letter/integer pairs for values
  

# Final: string



# **Algorithm**

# *High level thought process / brainstorming ideas
# - create a hash with all lowercase alphabetical letters as the keys, 
#   - the value for each letter should be its position numerically in the alphabet
# - create an array of words from the given string, separated on whitespace
# - create a placeholder variable of an empty array (will hold 2 elements - word/string and its value
#   - initialily will be ['', 0]
# - Iterate over the array of words
#     - init a variable word_value to 0
#   - for each word, iterate over its characters
#     - increment word_value by the value returned from referencing this character in the alphabet rankning hash 
#     - does this for each character 
#   - if word_value > than placeholder's value at index 1, 
#     - reassign placeholder variable at index 0 to the current word
#     - reassign placeholder variable at index 1 to the current word_value
# - return the element/string from index 0 of the placeholder variable


# *Lower level steps of implementation*
# - init a hash 'alphabet_ranking' that has all lowercase letters as the keys, 1 through 26 for each value
# - create an array word_array that is the result of splitting the given string on whitespace
#   - or just iterate over the result of this operation
# - init variable highest_value to an array of ['', 0']
# - Traverse word_array, `word`
#   - init word_value to 0
#   - Traverse the chars in `word`,`letter`
#     - increment word_value by the valu efound at alphabet_ranking[letter]
#   - if word_value > highest_value of index 1
#     - reassign highest_value of index 0 to `word` and index 1 to `word_value`
# - return word_value of indx 0


# **Code Implementation**

def alphabet_score(string)
  alphabet_ranking = ('a'..'z').zip(1..26).to_h
  highest_value = ['', 0]
  
  string.split.each do |word|
    word_value = 0
    word.each_char do |letter|
      word_value += alphabet_ranking[letter]
      highest_value = [word, word_value] if word_value > highest_value[1]
    end
  end
  highest_value[0]
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'
