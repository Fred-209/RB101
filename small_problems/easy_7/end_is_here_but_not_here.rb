# # The End Is Near But Not Here

# Write a method that returns the next to last word in the String passed to it as 
# an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a string

# *Explicit*: 
# - Return the next to last word from the given string
# - a word is defined as any sequence of non-blank characters
# - The input string will always contain at least two words

# *Implicit*: 
# - will not be given an empty string

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
# ```

# **Data Structure**
# Initial: String
# Intermediate: Array
# Final: String

# **Algorithm**

# *Pick out the last word from the given string, and return it*
# - Convert the given string into an array of words, separated on whitespace
# - return the string found at the next to last index


# **Code Implementation**

# def penultimate(sentence)
#   sentence.split[-2]
# end


# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

#Further Exploration

# Our solution ignored a couple of edge cases because we explicitly stated that 
# you didn't have to handle them: strings that contain just one word, and strings
#  that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. 
# What edge cases need to be considered? How would you handle those edge cases
#  without ignoring them? Write a method that returns the middle word of a phrase 
#  or sentence. It should handle all of the edge cases you thought of.

# *Edge Cases*
# - empty string
# - one word string
# - No defined middle because the length of the sentence when broken down into 
#   an array is not an odd number, so no definite middle word
#   - maybe return middle 2 words if this is the case
# - A proper name that has a space in it
# - You have to have at least 3 words to have a middle word
#   - If the length of the given string, when converted to an array of words, is 
#     less than three, then output a message saying there are not enough words 
#     given to have a middle word

# *Algorithm*

# *Determine the middle word in a given string and return it. If there is no middle
# word because there is an even number of words, return the 2 middle words. If there
# is no middle because of there being too few number of words to have a middle, 
# return a message saying as much*

# - Convert the given string into an array of words, split on whitespace
# - If the size of the array contains less than 3 words, return a message saying
#   there is no middle word because of too few words given.
# - If the array has an odd number of elements: 
#     - return the element at index of array size / 2
#   else
#     return the element at ( (array size / 2) -1) + element at (array size /2)
#       - these should be joined together by a whitespace, in the order from above
  

def find_the_middle(sentence)
  word_array = sentence.split
  return "There are not enough words given to find a middle." if word_array.size < 3
  if word_array.size.odd? 
    word_array[word_array.size / 2]
  else
    word_array[(word_array.size / 2) - 1] + ' ' + word_array[word_array.size / 2]
  end
end

p find_the_middle("here three words") == "three"
p find_the_middle("") == "There are not enough words given to find a middle."
p find_the_middle('two words') == "There are not enough words given to find a middle."
p find_the_middle('one') == "There are not enough words given to find a middle."
p find_the_middle("This is a sentence.") == 'is a'
p find_the_middle("This is a longer sentence.") == 'a'




