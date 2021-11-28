# # How long are you?

# Write a method that takes a string as an argument, and returns an Array that 
# contains every word from the string, to which you have appended a space and the 
# word length.

# You may assume that words in the string are separated by exactly one space, and
#  that any substring of non-space characters is a word.

# **Rules/Requirements**

# *Input*: string
# *Output*: array of strings

# *Explicit*: 
# - return every word from the string, followed by an integer representing the word's
# character length
# - Each word in the given string will be separated by exactly one space
# - any substring of non-space characters is considered a word

# *Implicit*: 
# - A given empty string should return an empty array

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []
# ```

# **Data Structure**

# Initial: string
# Intermediate: array
# Return: array

# **Algorithm**
# - Separate the given string into an array of its words, delimited on spaces
# - create an empty array word_lengths
# - Iterate over the array of words created above (word), using transformation(map)
#   - assign 'char_count' equal to the length of the current iteration word
#   - return the string 'word count' as the return value for current map iteration

# **Code Implementation**

def word_lengths(str)
  word_list = str.split
  
  word_list.map do |word|
    count = word.length
    "#{word} #{count}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []