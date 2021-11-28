# # # Group Anagrams

# # Given the array...

# # Copy Code
# # words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
# #           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
# #           'flow', 'neon']
# # Write a program that prints out groups of words that are anagrams. Anagrams are
# # words that have the same exact letters in them but in a different order. Your
# #  output should look something like this:

# # **Rules/Requirements**

# # *Input*: an array of string words
# # *Output*: none, outputs to screen

# # *Explicit*: 
# # - Find all number of anagrams for each word in the given array of words
# # - anagrams are words that have the same exact letters in them but presented in a 
# # different order


# # *Implicit*: 
# # - The anagrams must be the same number of characters long

# # *Questions:*

# # **Examples/Test Cases**

# # ```ruby
# # ["demo", "dome", "mode"]
# # ["neon", "none"]
# # #(etc)
# # ```

# # **Data Structure**

# # Initial: array
# # Intermediate: use a hash map to map a word to all of it's possible anagrams
# # Return: none, outputs to screen

# # **Algorithm**
# - create an empty hash `anagrams`
# - Iterate over the given array of words
#  - convert the word into an array of its characters, `characters`
#  - sort 'characters' using default sort method
#  - if sorted 'characters' is not a key in 'anagrams', set anagrams[sorted characters] 
#   equal to an array of this current iteration word
#   if sorted characters already is a key in 'anagrams', append the current word
#     to the value array for this sorted characters key
# - print out the 'anagrams' hash to the screen

# # **Code Implementation**


def display_anagrams(word_list)
  anagrams = {}

  word_list.each do |word|
    sorted_word = word.chars.sort.join

    if anagrams.has_key?(sorted_word)
      anagrams[sorted_word] << word
    else
      anagrams[sorted_word] = [word]
    end
  end
  anagrams.each_value { |val| p val}
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

display_anagrams(words) 