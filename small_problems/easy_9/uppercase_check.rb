# <!-- # Uppercase Check

# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

# **Rules/Requirements**

# *Input*: string
# *Output*: boolean

# *Explicit*: 
# - return true if all chracters inside the string are uppercase, false if not
# - ignore non alphabetic characters

# *Implicit*: 
# - A given empty string should return 'true'

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true
# ```

# **Data Structure**

# Initial: string
# Intermediate: array
# Return: boolean

# **Algorithm**
# *Iterate over the given string's characters and return `true` if every character
# that is a letter is also uppercase. Return `false` if the string has letter characters
# and any of them are lower case.*
# - create empty array `lower_case_letters`
# - create empty array `upper_case_letters`
#  - Iterate over each character in the given string
#   - if the curent iteration character is equal to a the character lowercased, append
#   the character to the 'lower_case_letters` array
#   - If the current iteration char is equal to the characer uppercased, append it to 
#   `upper_case_letters` array
#   - Do nothing (or skip to the next iteration) if the character is neither an uppercase or lowercase letter
# - if `lower_case_letters` is empty, return `true`, otherwise return `false`


# **Code Implementation** -->

def uppercase?(str)
  # !str.match?(/[a-z]/)
  str.chars.none? { |char| ('a'..'z').include?(char)}
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') #== true
p uppercase?('4SCORE!') #== true
p uppercase?('') == true
