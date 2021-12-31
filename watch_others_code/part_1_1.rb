#  # Problem Description

#  Given a non-empty string, check if it can be constructed by taking a substring
#  of it and appending multiple copies of the substring together. The given string
#  lowercase English letters only.


# **Rules/Requirements**

# *Input*: a string

# *Output*: boolean


# *Explicit Requirements*: 
# - return true if a substring of the given string can be duplicated a number of 
# times to build a string that equals the given string
# - lowercase english letters only in the given string

# *Implicit Requirements*: 
#  - Only even length strings can return `true`



# *Questions:*
# - How to handle a 1 char string?
#  - It's odd length, will not work. There is no substring to duplicate
#   - this should return false

# *Edge Cases*:
# - p repeated_substring_pattern('a') == false


# **Examples/Test Cases**
# ```ruby
# p repeated_substring_pattern('abab') == true
# p repeated_substring_pattern('aba') == false
# p repeated_substring_pattern('aabaaba') == false
# p repeated_substring_pattern('abaababaab') == true
# p repeated_substring_pattern('abcabcabcabc') == true
# ```

# **Data Structure**
# Initial: string

# Intermediate: an array of the string split into 2 equal halves

# Final: - boolean



# **Algorithm**

# *High level thought process / brainstorming ideas
# - If the string is an odd number of characters long, return false
# - Split the string into 2 equal halves of characters**
# - compare the 2 halves for equality-- )array elements 0 and 1
#  - return true if they're equal, false otherwise

# *split string into 2 equal halves of characters*
# - halfway would be (length of string / 2) 
# - init first_half variable to given_string of index 0 to halfway index, exclusive
# - init second_half variable to a  substring of the given string from halfway through 
# the end of the string, inclusive
# - return an array of [first_half, second_half]

# *Lower level steps of implementation*



# **Code Implementation**

def repeated_substring_pattern(string)
  return false if string.length.odd?

  split_string = halve_string(string)
  split_string[0] == split_string[1]
end

def halve_string(string)
  halfway_point = string.length / 2

  first_half = string[0...halfway_point]
  second_half = string[halfway_point..-1]
  [first_half, second_half]
end

p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabcabc') == true