# # ASCII String Value

# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# **Rules/Requirements**

# *Input*: a string
# *Output*: an integer

# *Explicit*: 
# - The ASCII string value of a string is the sum of the ASCII values of every character in the string

# *Implicit*: 


# **Examples/Test Cases**
# ```ruby
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
# ```

# **Data Structure**

# **Algorithm**

# - Assign variable `ascii_sum` to the integer 0
# - Iterate over each character in the given string
#   - Determine the ASCII value of the current character
#   - Add this value to `ascii_sum`
# - Return `ascii_sum`

def ascii_value(string)
  ascii_sum = 0
  string.each_char { |char| ascii_sum += char.ord}

  ascii_sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration

# There is an Integer method such that:

# char.ord.mystery == char

# where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

# The mystery method is Integer#chr, which returns a string representation of the integers value according to encoding.
# If you call this Integer#chr method on a string with more than one character, the method uses just the first character in the string to convert.
