
# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# **Rules/Requirements**

# *Input*: string

# *Output*: hash with 3 entries (lowercase, uppercase, neither) symbols as keys, 
#   floats (to represent percentages) as the values for each one
  


# *Explicit Requirements*: 
# - the given string will always contain at least one character
# - count the number of uppercase, lowercase, and 'neither' type of characters
#   in the given string and calculate percentages of total characters these types
#   represent
    


# *Implicit Requirements*: 
#  -


# *Questions:*
# - do spaces count as a 'neither' type of character?
#     will assume yes based on test cases
    
# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
# ```

# **Data Structure**
# Initial: string

# Intermediate: multiple arrays to separate and contain uppercase, lowercase, neither chars

# Final: hash



# **Algorithm**

# *High level thought process / brainstorming ideas

# - create hash with lowercase, uppercase, neither as keys, 0.0 as values
# - create an array of given chars
# - Create 3 separate arrays to contain characters from the given string
#     uppercase chars, lowercase chars, neither chars
# Get the total character count from the given string, and the character counts from the 
#   3 created arrays
# These numbers will be used to calculate the percentages that each character type represents from the original given string
# - Use a helper method to calculate percentage
#   - pass in total character count and character_type character count
#   - helper method should return a float
#   - assign the return of this helper to the correct hash entry in the return hash (this     also the same hash created above)
# - return the hash from above

# *Lower level steps of implementation*

# - init a hash `character_percentages`
#     - has 3 keys: `lowercase`, `uppercase`, `neither`
#     - all have values of 0.0
# - init `characters_array` to an array of all the characters from the given string
# - init `lowercase` to be an array of chars of all lowercase characters found in `characters_array`
#     - can use `select` for this
#     - repeat this process for uppercase and neither
#     - can use a range of a..z for lowercase, A..Z for uppercase, and the negated combo 
#       of both of these for nether
# - assign `character_percentages` of `lowercase` to the result of calling get_percentage and passing in the count of characters in `character_percentages` as the first argument, and the count of characters in `lowercase` letters as the second argument
#   - repeat the above for `uppercase` and `neither`

#     - return `character_percentages`

# **get_percentage(total, partial)- returns float
#   - percentage = (partial float / total) * 100 
    
    
# **Code Implementation**
      
def letter_percentages(string)
  character_percentages = {}
  total_char_count = string.length
  
  lowercase_count  = string.count("a-z")
  uppercase_count = string.count("A-Z")
  neither_count = string.count("^a-zA-Z")
  
  character_percentages[:lowercase] = get_percentage(total_char_count, lowercase_count)
  character_percentages[:uppercase] = get_percentage(total_char_count, uppercase_count)
  character_percentages[:neither] = get_percentage(total_char_count, neither_count)
  
  character_percentages
end
   
def get_percentage(total, partial)
  (partial.to_f / total) * 100
end

    

    
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
    

