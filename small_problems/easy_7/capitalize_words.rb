require 'pry'

# # Capitalize Words

# Write a method that takes a single String argument and returns a new string that
#  contains the original value of the argument with the first character of every 
#  word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# **Rules/Requirements**

# *Input*:a string
# *Output*: new string, modified version of original

# *Explicit*: 
# - Capitalize every word in the given string
# - a word is any sequence of non-blank characters for this
# - all other letters beyond the first letter should be lowercase for each word

# *Implicit*: 
#  - Will not be given a blank string

# *Questions:*

# **Examples/Test Cases**
# ```ruby
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# ```

# **Data Structure**
# Initial: String
# Intermediate: array of words
# Final: string

# **Algorithm**
# - One-liner method to solve this is string.split.map(&:capitalize).join(' ')
# - Two other methods to solve this problem:
#   - Method 1
      # - Split the given string up into an array or words, 'str_array'
      # - Traverse the array of words, 'word' as the element
      #   - Traverse each character in `word`, 'char' as the element
      #     - if 'char' is the character at index of 'word', upcase it, destructively
      #       - else, downcase it destructively
      # - Join str_array so that it's a string split on whitespace
      # - return str_array after this join

  
#     - Method 2
        # - split the given string into an array of words
        # - Iterate over this array of words using transformation, `word`
        #   - Assign the character at index  0 of `word` to a new variable name 
        #     - and upcase it
        #   - Assign the rest of the `word` string characters, a range from index 1 to end of string, 
        #     - to a new variable
        #     - downcase every letter in this variable
        #   return the concatenation of these two variables as the transformed element for the above array
        #   iteration
        # - Convert the modified array of strings into one string, join them together on whitespace
        # - Return this modified string


# **Code Implementation**

def word_cap_1(str)
  str_array = str.split
  str_array.each.with_index do |word, word_index|
    word.each_char.with_index do |char, char_index|
      if char_index == 0
        str_array[word_index][0] = char.upcase
      else
        str_array[word_index][char_index] = char.downcase
      end
    end
  end
  str_array.join(' ')
end

p word_cap_1('four score and seven') #== 'Four Score And Seven'
p word_cap_1('the javaScript language')# == 'The Javascript Language'
p word_cap_1('this is a "quoted" word') #== 'This Is A "quoted" Word'

def word_cap_2(str)
  str_array = str.split
  case_switched_array = 
  str_array.map do |word|
    first_letter = word.chars[0].upcase
    rest_of_word = word.chars[1..].map(&:downcase).join
    
    first_letter + rest_of_word
  end
  case_switched_array.join(' ')
end


p word_cap_2('four score and seven') #== 'Four Score And Seven'
p word_cap_2('the javaScript language')# == 'The Javascript Language'
p word_cap_2('this is a "quoted" word') #== 'This Is A "quoted" Word'
