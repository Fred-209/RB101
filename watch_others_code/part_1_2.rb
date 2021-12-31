# Problem Description

# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer

# **Rules/Requirements**

# *Input*: an array of strings

# *Output*: an array of string characters


# *Explicit Requirements*: 
# - given array of strings will consist of only lowercase characters

# - in the return array, i need to include duplicate characters
#   - If a duplicate of a character common to every string from the given array
#     is found say 2x, return 2 elements of that character in the return array


# *Implicit Requirements*: 
#  - no need to worry about chracters other than lowercase alphabetic characters


# *Questions:*
# - How to handle an empty given array?
#   - return an empty array

# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# common_chars(%w[bella label roller]) == %w[e l l]
# common_chars(%w[cool lock cook]) == %w[c o]
# common_chars(%w[hello goodbye booya random]) == %w[o]
# common_chars ($w[aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz]) == []
# ```

# **Data Structure**
# Initial: array of strings

# Intermediate: 
# - array of characters, array of strings

# Final: array of string characters



# **Algorithm**

# *High level thought process / brainstorming ideas

# I need to check each string element from the given array for common characters between all of them. 
# If a common character is repeated more than once in all of the string elements, then that character needs to be included in the return array the number of times that it appears in every given string

# - Iterate over the characters in the first word as a baseline
# - Then check each of the other string words from the given array to see if the current character in this iteration is included them
#   - If so, i can add it to an array I initialize to build upon
# - Need to track the number of times this character is found in each string element, including the one I broke down into characters
# - can use String#count for this
# - For each 'character' iteration, i can init an empty array `char_count` , and append the count of the number of times the current character appears in the current word i'm checking for this character's inclusion
#   The first code expresssion within the current character iteration should be to add the count of this character from the string I broke down into the characters, probably going to be given_array[0]
# - Then append the count of the number of times the curent character is found in the current 'string' to the `char_count` array
# - Then go onto to do this for every other string element from the given array
# - If the `char_count` array has a 0 in it, that means that one of the string elements does not contain the character I'm looking for, therefore it is not common between all three
# - So skip to next character iteration if there is a 0 in the char_count array
# - If there is no 0, i need to append this current char to the return array I'm building X number of times, where X is the smallest number found from the char_count array
# - So find the minimum number from char_count, and append the current string that number of times to the return array I'm building
# - return the array I was building upon
  



# *Lower level steps of implementation*
# - init an empty array `common_chars`
# - init variable `baseline_word_chars` to an array of characters 
# from the string found at index 0 of the given array 
# - init an array equal to the subarray created from the elements found at index 1 through the end of the given array, `strings_to_check`
# - Iterate over `baseline_word_chars`, `char`
    # - skip to next iteration char if `common_chars` already includes the current char
#   - init empty array `char_count`
#   - find the number of times the current character appears in the baseline_word and
#   append it to `char_count`
#   - Iterate over `strings_to_check`, `string`
#     - count the number of times th current char appears in the current string
#     - append it to char_count
#   - If char_count includes a 0, skip to next char iteration
#   - otherwise:
#     - find the smallest number from `char_count`
#     - append the current char this number of times to `common_chars`
# - return `common_chars`




# **Code Implementation**

def common_chars(string_array)
  common_chars = []
  baseline_word_chars = string_array[0].chars
  strings_to_check = string_array[1..-1]
  
  baseline_word_chars.each do |char|
    next if common_chars.include?(char)
    char_count = []
    char_count << baseline_word_chars.count(char)
    strings_to_check.each { |string| char_count << string.count(char) }
    next if char_count.include?(0)
    char_count.min.times { |_| common_chars << char }
  end  
  common_chars
      
end




p common_chars(%w[bella label roller]) == %w[e l l]
p common_chars(%w[cool lock cook]) == %w[c o]
p common_chars(%w[hello goodbye booya random]) == %w[o]
p common_chars(%w[aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz]) == []


