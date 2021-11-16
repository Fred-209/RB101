# # Lettercase Counter

# Write a method that takes a string, and then returns a hash that contains 3 
# entries: one represents the number of characters in the string that are lowercase 
# letters, one the number of characters that are uppercase letters, and one the 
# number of characters that are neither.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a hash with 3 entries

# *Explicit*: 
# - The return hash should contain 3 entries
#   - count of lowercase letters
#   - count of uppercase letters
#   - count of neither
# - The three key names should be lowercase, uppercase, neither


# *Implicit*: 
#  - if given an empty string, all the values of the returned hash should be 0
#   - any non-alphabetic letter should count as `neither`

# *Questions:*
# - Do blank spaces count as a `neither` character?
#   - The test cases seem to indicate that they do count as `neither`

# **Examples/Test Cases**
# ```ruby
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
# ```

# **Data Structure**
# Initial: String
# Intermeditate: operate on the given string
# Output: hash


# **Algorithm**
# - Create a hash with lowercase, uppercase, and neither as keys , with all values
#     set to 0
# - Count the number of lowercase letters in the given string, add the result to the 
#   value for the lowercase key
#   - the String#count method will be useful here
#   - can use "a-z", "A-Z", and "^a-z", "^A-Z" as the three arguments to pass into 
#     the count method that will give the count of lowercase, uppercase, and neither
#     respectively

# - repeated the above steps for uppercase and neither
# - Return the created hash with these updated values

# **Code Implementation**

def letter_case_count(str)
  character_counts = %i[lowercase uppercase neither].to_h do |case_type|
    [case_type, 0]
  end
  
  character_counts[:lowercase] = str.count "a-z"
  character_counts[:uppercase] = str.count "A-Z"
  character_counts[:neither] = str.count "^a-z", "^A-Z"
  
  character_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }