# # Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation,
# and whitespace should not be doubled.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a string

# *Explicit*: 
# - return a new string, with consonants doubled
# - Do not double vowels, digits, punctuation, or whitespace

# *Implicit*: 
# - a given empty string should return an empty string
# - non-consonants should be included in the return string, just not doubled

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""
# ```

# **Data Structure**

# Initial: string
# Intermediate: string
# Return: string

# **Algorithm**

# *Double each consonant in the given string and return this new string*
# - create an empty string `doubled_consonants`
# - Iterate over each character in the given string
#   - If the current character is not a vowel, any puncuation/whitespace, then
#     add two of this character to `doubled_consonants`
#     - not found in a-zA-Z AND not found in 'aeiou' is the pattern of characters
#       we want to double
#       /([aeiou]|\d|\w)/i
#   - else, add this character single to `doubled_consonants`
# return `doubled_consonants`

# **Code Implementation**

def double_consonants(str)
  doubled_consonants = ''
  str.each_char do |char|
    if char =~ /([aeiou]|\d|\W)/i
      doubled_consonants << char
    else
      doubled_consonants << char * 2
    end
  end  
  doubled_consonants
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""