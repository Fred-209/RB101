# # Letter Counter (Part 2)

# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a hash

# *Explicit*: 
# - Use the `word_sizes` method from the previous method, and modify it
# - When determining word size, non-alphabetical characters should be excluded


# *Implicit*: 
# - an empty string should return an empty hash


# **Examples/Test Cases**
# ```ruby
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}
# ```

# **Data Structure**

# **Algorithm**

# - Create an empty hash `word_counts` with a default value of 0
# - Remove all non-alphabetical characters from the given string
#   - will use regex for this and String#gsub!
#     - The regex to match against would be [^a-zA-Z\s], and these characters should be deleted from the string
# - Split the string into an array of its words, `str_array`
#   - Using String#split with no argument
# - Iterate over the elements in `str_array'
#   - If the length of the current element exists as a key name in `word_counts`, increment the value of this key/value pair by 1
#   - If it does not exist, add this length to `word_counts` as a key with a value of 1
# - Return `word_counts`

# def word_sizes(str)
#   str.gsub(/[^a-zA-Z ]/, '').split.each_with_object(Hash.new(0)) do |word, hsh|
#     hsh[word.length] += 1

#   end
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}


# Fun one liner to accomplish this
# str.gsub(/[^a-zA-Z\s]/, '').split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.length
# ] += 1}

# Using String#delete

def word_sizes(str)
  word_counts = Hash.new(0)

  str.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    word_counts[clean_word.length] += 1
  end
  word_counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}