# # Staggered Caps Part 1

# Write a method that takes a String as an argument, and returns a new String that
#  contains the original value using a staggered capitalization scheme in which 
#  every other character is capitalized, and the remaining characters are lowercase. 
#  Characters that are not letters should not be changed, but count as characters
#  when switching between upper and lowercase.


# **Rules/Requirements**

# *Input*: string
# *Output*: new string

# *Explicit*: 
# - Every other character should be capitalized
# - Characters that are not letters should not be changed
#   - They do count a a character when switching between cases

# *Implicit*: 

# *Questions:*
# - Return a blank string if given a blank string?
# - Spaces count as non-letter chracters?

# **Examples/Test Cases**

# ```ruby
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# ```

# **Data Structure**
# Initial: String
# Intermediate: Array of characters
# Final: String

# **Algorithm**

# *Iterate over every character in the string and alternate between making it uppercase
# and lowercase. Non-Letter characters should not be effected*
# - Convert the given string into an array consisting of its characters
# - create a toggle variable and set to false
# - Iterate over the array of characters
#   - Skip to the next loop iteration if the current character is included in either
#     a-z or A-Z range, and toggle the toggle variable
#   - If the toggle is true, upcase the current character
#     - Else, downcase it
# - Join the array of characters back into a string
# - return this new string
    

# **Code Implementation**

def staggered_case(string, start_with='')
  char_array = string.chars
  
  case start_with
  when 'lowercase'
    caps_lock = true
  when 'uppercase'
    caps_lock = false
  else
    if char_array[0] == char_array[0].downcase
      caps_lock = true
    else
      caps_lock = false
    end
  end
  
  char_array.map! do |character|
    caps_lock = !caps_lock
    next character unless /[a-z]/i =~ character
    caps_lock ? character.upcase : character.downcase
  end
 
  char_array.join
end

p staggered_case('i Love Launch School!', 'uppercase') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', 'lowercase') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

