# # Letter Counter (Part 1)

# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a hash

# *Explicit*: 
# - There will be only one space between the words
# - A word will consist of characters that do not include a space


# *Implicit*: 
# - If given a blank string, a blank hash should be returned
# - Punctuation will be considered part of a word
# - In the returned hash, the key should be an integer that represents the number of characters in the word, and the value is the number of words in the string that are equal in character size to this number




# **Examples/Test Cases**
# ```ruby
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}
# ```

# **Data Structure**

# **Algorithm**

# - Create empty hash `word_counts`
# - Split the string into an array, `str_array`, whitespace as the delimiter
# - Iterate over `str_array`
#     - If there is not a  key in 'word_counts' that matches the count of characters in the current element, add this count to `word_counts` with a value of 1
#     - If there is already a key with that name, increment the value of the key by 1
# - Return `word_counts`

def word_sizes(str)
  word_counts = {}
  str_array = str.split

  str_array.each do |word|
    if word_counts.has_key?(word.length)
      word_counts[word.length] += 1
    else
      word_counts[word.length] = 1
    end
  end

  word_counts
end

p word_sizes('Four score and seven.') == {3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}


