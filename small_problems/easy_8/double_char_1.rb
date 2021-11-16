# # Double Char Part 1

# Write a method that takes a string, and returns a new string in which every 
# character is doubled.


# **Rules/Requirements**

# *Input*: a string
# *Output*: string

# *Explicit*: 
# - return a new string, not the original modified
# - Each character in the given string should be doubled in the return string

# *Implicit*: 
# - an empty string given should return an empty string
# - spaces and special characters need to be doubled as well
# - letter casing should remain the same in the return string

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''
# ```

# **Data Structure**

# Initial: String
# Intermediate: a new string to build upon
# Return: a string

# **Algorithm**
# - create an empty string `repeated_string`
# - Iterate over each character in the given string, `char`
#   - Add `char` multipled by 2 to `repeated_string`
# - return `repeated_string`


# **Code Implementation**

def repeater(str)
  repeated_string = ''
  str.each_char { |char| repeated_string << char * 2}
  repeated_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''