# # Swap Case

# Write a method that takes a string as an argument and returns a new string in
#  which every uppercase letter is replaced by its lowercase version, and every 
#  lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a new string, modified version of original

# *Explicit*: 
# - May not use String#swapcase
# - If a character in the string is uppercase, replace it with a lowercase version
# - If a character in the string is lowercase, replace it with a uppercase version
# - do not alter any other characters

# *Implicit*: 
 
# *Questions:*
# - What to return if given an empty string?

# **Examples/Test Cases**
# ```ruby
# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# ```

# **Data Structure**
# Initial: string
# Intermediate: an array of characters
# Final: string


# **Algorithm**

# *Non-RegEx Way*
# - convert the given string into an array of characters
#   - char_array = given_string.chars
# - traverse each element of this new array, using transormation
#   - char_array.map do |char|
#     If the current element is equal to a downcase version of itself, then upcase it
#     Otherwise, downcase it
# - Convert the new modified array into a string, joined on whitespace as delimiter

# *RegEx Way*
# -


# **Code Implementation**

# def swapcase(str)
#   char_array = str.chars
#   swapcase_array = 
#     char_array.map do |char|
#       if char.upcase == char
#         char.downcase
#       else
#         char.upcase
#       end
#     end
#   swapcase_array.join
# end
      

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# One liner
# def swapcase_one_liner(str)
#   str.chars.map {|char| char == char.upcase ? char.downcase : char.upcase }.join
# end

# p swapcase_one_liner('CamelCase') == 'cAMELcASE'
# p swapcase_one_liner('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

#Regex
 
def swapcase_regex(str)
  str.gsub(/[a-z]/i) { |match| match.upcase == match ? match.downcase : match.upcase}
end

p swapcase_regex('CamelCase') == 'cAMELcASE'
p swapcase_regex('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'