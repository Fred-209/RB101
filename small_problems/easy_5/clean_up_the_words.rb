# # Clean up the Words

# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# **Rules/Requirements**

# *Input*: a string of lowercased words and non-alphabetic characters
# *Output*: a string, modified from the original 

# *Explicit*: 
# - All of the non-alphabetic characters should be removed from the given string
#   - They shoould be replaced by spaces
# - There should never be more than one space in a row
# - All the given letters will be lowercase

# *Implicit*: 
# - If there are multiple non-alphabetic characters in a row to be replaced by spaces, then those spaces will need to be pruned down until there is only one space


# **Examples/Test Cases**
# ```ruby
# cleanup("---what's my +*& line?") == ' what s my line '
# ```

# **Data Structure**

# **Algorithm**

# - Remove all non-alphabetic characters from the given string
#    - use Regex [^a-zA-Z] to match all non-alphabetic characters and substitute a blank space for each one of them, save as `modified_str'`
# - Create a new blank string named `cleaned_string'
# - Iterate over each character in `modified_str`
#   - If the current element is a blank space ' ' : 
#     - If the character at the current element's index + 1 is also equal to a blank space, go onto the next iteration of this iterator
#     - If the element next in line (index + 1) is not a blank space, append this current element (blank space) to 'cleaned_string'
#   - If current element is not a blank space, append it to 'cleaned_string'
# - Return `cleaned_string`

def cleanup(str)
  cleaned_str = ''
  modified_str = str.gsub(/[^a-z]/, ' ')

  modified_str.each_char.with_index do |char, idx|
    if char == ' ' && modified_str[idx + 1] == ' '
      next
    else
      cleaned_str << char
    end
  end

  cleaned_str
end
p cleanup("---what's my +*& line?")
p cleanup("---what's my +*& line?") == ' what s my line '